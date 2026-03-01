#!/usr/bin/env bash
set -euo pipefail

# Build all Daisy Patch firmware projects from projects.json
# Requires: arm-none-eabi-gcc, jq, git, gh (GitHub CLI)
#
# Supports three acquisition modes per project:
#   1. "release" — download pre-built .bin from GitHub releases
#   2. "make"    — clone and build with arm-none-eabi-gcc
#   3. "arduino" — skip (requires Arduino CLI, not automated)

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
ROOT_DIR="$(dirname "$SCRIPT_DIR")"
BUILD_ROOT="${ROOT_DIR}/build"
SOURCES_ROOT="${ROOT_DIR}/sources"
OUTPUT_DIR="${ROOT_DIR}/output"
MANIFEST="${ROOT_DIR}/projects.json"

LIBDAISY_VERSION=$(jq -r '._libdaisy_version' "$MANIFEST")
DAISYSP_VERSION=$(jq -r '._daisysp_version' "$MANIFEST")

mkdir -p "$BUILD_ROOT" "$SOURCES_ROOT" "$OUTPUT_DIR"

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
NC='\033[0m'

log()  { echo -e "${GREEN}[BUILD]${NC} $*"; }
warn() { echo -e "${YELLOW}[WARN]${NC} $*"; }
fail() { echo -e "${RED}[FAIL]${NC} $*"; }
info() { echo -e "${CYAN}[INFO]${NC} $*"; }

# Clone or update libDaisy and DaisySP
setup_libs() {
    log "Setting up libDaisy ${LIBDAISY_VERSION} and DaisySP ${DAISYSP_VERSION}..."

    if [ ! -d "${SOURCES_ROOT}/libDaisy" ]; then
        git clone https://github.com/electro-smith/libDaisy.git "${SOURCES_ROOT}/libDaisy"
    fi
    cd "${SOURCES_ROOT}/libDaisy"
    git fetch --tags
    git checkout "$LIBDAISY_VERSION" 2>/dev/null || git checkout "tags/${LIBDAISY_VERSION}"
    git submodule update --init --recursive
    make -j"$(nproc)"
    cd "$ROOT_DIR"

    if [ ! -d "${SOURCES_ROOT}/DaisySP" ]; then
        git clone https://github.com/electro-smith/DaisySP.git "${SOURCES_ROOT}/DaisySP"
    fi
    cd "${SOURCES_ROOT}/DaisySP"
    git fetch --tags
    git checkout "$DAISYSP_VERSION" 2>/dev/null || git checkout "tags/${DAISYSP_VERSION}"
    git submodule update --init --recursive
    make -j"$(nproc)"
    cd "$ROOT_DIR"
}

# Download pre-built .bin from GitHub releases
download_release_bin() {
    local name="$1"
    local repo="$2"
    local release_asset="$3"  # specific asset name, or "auto" to grab first .bin

    local owner_repo
    owner_repo=$(echo "$repo" | sed 's|https://github.com/||' | sed 's|\.git$||')

    info "Downloading release binary for ${name} from ${owner_repo}..."

    if [ "$release_asset" = "auto" ]; then
        # Get the latest release and find .bin assets
        local asset_url
        asset_url=$(gh release view -R "$owner_repo" --json assets \
            --jq '[.assets[] | select(.name | endswith(".bin"))][0].url' 2>/dev/null) || {
            fail "No releases found for ${owner_repo}"
            return 1
        }

        if [ -z "$asset_url" ] || [ "$asset_url" = "null" ]; then
            fail "No .bin assets in latest release of ${owner_repo}"
            return 1
        fi

        gh release download -R "$owner_repo" --pattern "*.bin" -D "${OUTPUT_DIR}" --clobber 2>/dev/null || {
            fail "Failed to download release bins from ${owner_repo}"
            return 1
        }

        # Rename to standardized name if only one bin
        local bin_count
        bin_count=$(find "${OUTPUT_DIR}" -maxdepth 1 -name "*.bin" -newer "$MANIFEST" 2>/dev/null | wc -l)
        if [ "$bin_count" -eq 1 ]; then
            local downloaded
            downloaded=$(find "${OUTPUT_DIR}" -maxdepth 1 -name "*.bin" -newer "$MANIFEST" 2>/dev/null | head -1)
            if [ "$(basename "$downloaded")" != "${name}.bin" ]; then
                mv "$downloaded" "${OUTPUT_DIR}/${name}.bin"
            fi
        fi
    else
        # Download specific asset
        gh release download -R "$owner_repo" --pattern "$release_asset" -D "${OUTPUT_DIR}" --clobber 2>/dev/null || {
            fail "Failed to download ${release_asset} from ${owner_repo}"
            return 1
        }
    fi

    log "Downloaded release bin for ${name}"
    return 0
}

# Build a single project from source
build_project() {
    local name="$1"
    local repo="$2"
    local build_dir="$3"
    local build_system="$4"
    local pre_build="$5"
    local make_target="$6"

    local src_dir="${SOURCES_ROOT}/${name}"

    log "Building ${name}..."

    # Clone if needed (without submodules — we provide our own libDaisy/DaisySP)
    if [ ! -d "$src_dir" ]; then
        git clone --depth 1 "$repo" "$src_dir" 2>/dev/null || {
            fail "Failed to clone ${repo}"
            return 1
        }
    fi

    # Init non-library submodules (skip libDaisy/DaisySP since we provide our own)
    if [ -f "${src_dir}/.gitmodules" ]; then
        cd "$src_dir"
        local submodules
        submodules=$(git config --file .gitmodules --get-regexp 'submodule\..*\.path' 2>/dev/null | awk '{print $2}' || true)
        for sub in $submodules; do
            case "$sub" in
                libDaisy|DaisySP|libdaisy|daisysp) ;;  # skip — we provide these
                *) git submodule update --init --recursive -- "$sub" 2>/dev/null || true ;;
            esac
        done
        cd "$ROOT_DIR"
    fi

    local full_build_dir="${src_dir}/${build_dir}"
    [ "$build_dir" = "." ] && full_build_dir="$src_dir"

    if [ ! -d "$full_build_dir" ]; then
        fail "Build directory not found: ${full_build_dir}"
        return 1
    fi

    # Force-replace any libDaisy/DaisySP dirs (including submodule checkouts) with symlinks
    for link_dir in "$src_dir" "$full_build_dir"; do
        [ ! -d "$link_dir" ] && continue
        for lib_name in libDaisy DaisySP libdaisy; do
            local target="${SOURCES_ROOT}/libDaisy"
            [ "$lib_name" = "DaisySP" ] && target="${SOURCES_ROOT}/DaisySP"
            if [ -L "${link_dir}/${lib_name}" ]; then
                continue  # already a symlink
            fi
            if [ -d "${link_dir}/${lib_name}" ]; then
                rm -rf "${link_dir}/${lib_name}"  # remove submodule checkout
            fi
            ln -sf "$target" "${link_dir}/${lib_name}" 2>/dev/null || true
        done
    done

    cd "$full_build_dir"

    # Run pre-build command if specified
    if [ -n "$pre_build" ] && [ "$pre_build" != "null" ]; then
        info "Running pre-build: ${pre_build}"
        eval "$pre_build" 2>/dev/null || true
    fi

    case "$build_system" in
        make)
            local make_args=(
                -j"$(nproc)"
                "DAISYSP_DIR=${SOURCES_ROOT}/DaisySP"
                "LIBDAISY_DIR=${SOURCES_ROOT}/libDaisy"
                "SYSTEM_FILES_DIR=${SOURCES_ROOT}/libDaisy/core"
                "USE_DAISYSP_LGPL=1"
            )

            if [ -n "$make_target" ] && [ "$make_target" != "null" ]; then
                make_args+=("$make_target")
            fi

            if make "${make_args[@]}" 2>"${OUTPUT_DIR}/${name}.build.log"; then
                # Find the .bin file
                local bin_file
                bin_file=$(find "$full_build_dir" -maxdepth 3 -name "*.bin" -newer "$MANIFEST" 2>/dev/null | head -1)

                if [ -z "$bin_file" ]; then
                    bin_file=$(find "$full_build_dir" -maxdepth 3 -name "*.bin" 2>/dev/null | head -1)
                fi

                if [ -n "$bin_file" ]; then
                    cp "$bin_file" "${OUTPUT_DIR}/${name}.bin"
                    log "Built ${name} -> ${OUTPUT_DIR}/${name}.bin"
                    return 0
                else
                    warn "Build succeeded but no .bin found for ${name}"
                    return 1
                fi
            else
                fail "Build failed for ${name} (see ${OUTPUT_DIR}/${name}.build.log)"
                return 1
            fi
            ;;
        arduino|platformio|micropython|gen~|none|cmake|cargo|stm32cubeide|needs-update)
            warn "Skipping ${name} (requires ${build_system})"
            return 1
            ;;
        *)
            warn "Unknown build system '${build_system}' for ${name}"
            return 1
            ;;
    esac
}

# Main
main() {
    local filter="${1:-}"
    local total=0
    local success=0
    local failed=0
    local skipped=0
    local downloaded=0

    # Check prerequisites
    if ! command -v arm-none-eabi-gcc &>/dev/null; then
        fail "arm-none-eabi-gcc not found. Install with: sudo apt install gcc-arm-none-eabi"
        exit 1
    fi
    if ! command -v jq &>/dev/null; then
        fail "jq not found. Install with: sudo apt install jq"
        exit 1
    fi

    setup_libs

    local project_count
    project_count=$(jq '.projects | length' "$MANIFEST")

    for i in $(seq 0 $((project_count - 1))); do
        local name repo build_dir build_system release_asset pre_build make_target
        name=$(jq -r ".projects[$i].name" "$MANIFEST")
        repo=$(jq -r ".projects[$i].repo" "$MANIFEST")
        build_dir=$(jq -r ".projects[$i].build_dir" "$MANIFEST")
        build_system=$(jq -r ".projects[$i].build_system" "$MANIFEST")
        release_asset=$(jq -r ".projects[$i].release_asset // empty" "$MANIFEST")
        pre_build=$(jq -r ".projects[$i].pre_build // empty" "$MANIFEST")
        make_target=$(jq -r ".projects[$i].make_target // empty" "$MANIFEST")

        # Filter if specified
        if [ -n "$filter" ] && [ "$name" != "$filter" ]; then
            continue
        fi

        total=$((total + 1))

        # Skip if output already exists
        if [ -f "${OUTPUT_DIR}/${name}.bin" ]; then
            info "Already have ${name}.bin, skipping"
            success=$((success + 1))
            continue
        fi

        # Try release download first if configured
        if [ -n "$release_asset" ]; then
            if download_release_bin "$name" "$repo" "$release_asset"; then
                downloaded=$((downloaded + 1))
                success=$((success + 1))
                continue
            fi
            warn "Release download failed for ${name}, falling back to build..."
        fi

        # Build from source
        if build_project "$name" "$repo" "$build_dir" "$build_system" "$pre_build" "$make_target"; then
            success=$((success + 1))
        else
            failed=$((failed + 1))
        fi

        cd "$ROOT_DIR"
    done

    echo ""
    log "========================================="
    log "Build Summary"
    log "========================================="
    log "Total:      ${total}"
    log "Success:    ${success} (${downloaded} from releases)"
    fail "Failed:     ${failed}"
    log "Output dir: ${OUTPUT_DIR}/"
    log "========================================="
}

main "$@"
