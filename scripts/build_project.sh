#!/usr/bin/env bash
set -euo pipefail

# Build a single project by name
# Usage: ./scripts/build_project.sh <project-name>

if [ $# -eq 0 ]; then
    echo "Usage: $0 <project-name>"
    echo ""
    echo "Available projects:"
    jq -r '.projects[].name' "$(dirname "$0")/../projects.json" | sort
    exit 1
fi

exec "$(dirname "$0")/build_all.sh" "$1"
