#!/usr/bin/env bash
set -euo pipefail

# Build all Daisy Patch firmware projects from projects.json
# Requires: arm-none-eabi-gcc, jq, git

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
NC='\033[0m'

log() { echo -e "${GREEN}[BUILD]${NC} $*"; }
warn() { echo -e "${YELLOW}[WARN]${NC} $*"; }
fail() { echo -e "${RED}[FAIL]${NC} $*"; }

# Clone or update libDaisy and DaisySP
setup_libs() {
    log "Setting up libDaisy ${LIBDAISY_VERSION} and DaisySP ${DAISYSP_VERSION}..."

    if [ ! -d "${SOURCES_ROOT}/libDaisy" ]; then
        git clone https://github.com/electro-smith/libDaisy.git "${SOURCES_ROOT}/libDaisy"
    fi
    cd "${SOURCES_ROOT}/libDaisy"
    git fetch --tags
    git checkout "$LIBDAISY_VERSION" 2>/dev/null || git checkout "tags/${LIBDAISY_VERSION}"
    make -j"$(nproc)" 2>/dev/null || true
    cd "$ROOT_DIR"

    if [ ! -d "${SOURCES_ROOT}/DaisySP" ]; then
        git clone https://github.com/electro-smith/DaisySP.git "${SOURCES_ROOT}/DaisySP"
    fi
    cd "${SOURCES_ROOT}/DaisySP"
    git fetch --tags
    git checkout "$DAISYSP_VERSION" 2>/dev/null || git checkout "tags/${DAISYSP_VERSION}"
    make -j"$(nproc)" 2>/dev/null || true
    cd "$ROOT_DIR"
}

# Build a single project
build_project() {
    local name="$1"
    local repo="$2"
    local build_dir="$3"
    local build_system="$4"

    local repo_name
    repo_name=$(echo "$repo" | sed 's|.*/||' | sed 's|\.git$||')
    local src_dir="${SOURCES_ROOT}/${name}"

    log "Building ${name}..."

    # Clone if needed
    if [ ! -d "$src_dir" ]; then
        git clone --recurse-submodules "$repo" "$src_dir" 2>/dev/null || {
            fail "Failed to clone ${repo}"
            return 1
        }
    fi

    local full_build_dir="${src_dir}/${build_dir}"
    [ "$build_dir" = "." ] && full_build_dir="$src_dir"

    if [ ! -d "$full_build_dir" ]; then
        fail "Build directory not found: ${full_build_dir}"
        return 1
    fi

    cd "$full_build_dir"

    case "$build_system" in
        make)
            # Try to build, setting DAISYSP and LIBDAISY paths
            if make -j"$(nproc)" \
                DAISYSP_DIR="${SOURCES_ROOT}/DaisySP" \
                LIBDAISY_DIR="${SOURCES_ROOT}/libDaisy" \
                2>"${OUTPUT_DIR}/${name}.log"; then

                # Find the .bin file
                local bin_file
                bin_file=$(find "$full_build_dir" -maxdepth 2 -name "*.bin" -newer "$MANIFEST" 2>/dev/null | head -1)

                if [ -z "$bin_file" ]; then
                    # Try any .bin file
                    bin_file=$(find "$full_build_dir" -maxdepth 2 -name "*.bin" 2>/dev/null | head -1)
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
                fail "Build failed for ${name} (see ${OUTPUT_DIR}/${name}.log)"
                return 1
            fi
            ;;
        arduino)
            warn "Skipping Arduino project ${name} (requires Arduino CLI)"
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
        local name repo build_dir build_system
        name=$(jq -r ".projects[$i].name" "$MANIFEST")
        repo=$(jq -r ".projects[$i].repo" "$MANIFEST")
        build_dir=$(jq -r ".projects[$i].build_dir" "$MANIFEST")
        build_system=$(jq -r ".projects[$i].build_system" "$MANIFEST")

        # Filter if specified
        if [ -n "$filter" ] && [ "$name" != "$filter" ]; then
            continue
        fi

        total=$((total + 1))

        if build_project "$name" "$repo" "$build_dir" "$build_system"; then
            success=$((success + 1))
        else
            failed=$((failed + 1))
        fi
    done

    echo ""
    log "========================================="
    log "Build Summary"
    log "========================================="
    log "Total:   ${total}"
    log "Success: ${success}"
    fail "Failed:  ${failed}"
    log "Output:  ${OUTPUT_DIR}/"
    log "========================================="
}

main "$@"
