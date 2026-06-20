#!/bin/bash
set -e

DUMP_DIR="$1"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
VENDOR_DIR="$(realpath "$SCRIPT_DIR/../../../vendor/nothing/asteroids")"
PROP_FILE="$SCRIPT_DIR/proprietary-files.txt"

if [[ -z "$DUMP_DIR" || ! -d "$DUMP_DIR" ]]; then
    echo "Usage: $0 <path-to-dump>"
    exit 1
fi

DUMP_DIR="$(realpath "$DUMP_DIR")"
mkdir -p "$VENDOR_DIR/proprietary"

copied=0; missing=0

while IFS= read -r line; do
    [[ -z "$line" || "$line" == \#* ]] && continue
    line="${line#-}"
    src="${line%%:*}"
    dst="${line##*:}"

    src_path="$DUMP_DIR/$src"
    dst_path="$VENDOR_DIR/proprietary/$dst"

    if [[ -f "$src_path" ]]; then
        mkdir -p "$(dirname "$dst_path")"
        cp -a "$src_path" "$dst_path"
        copied=$((copied + 1))
    else
        echo "MISSING: $src"
        missing=$((missing + 1))
    fi
done < "$PROP_FILE"

echo ""
echo "Extracted: $copied files, $missing missing"
