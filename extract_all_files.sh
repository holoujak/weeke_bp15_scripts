#!/bin/bash
#
# Recursively extract all files from an OS-9 image using ToolShed utilities.
#

if [ -z "$1" ]; then
    echo "Usage: $0 <path/to/image.img> [output_dir]"
    exit 1
fi

IMG="$1"
DEST="${2:-./disk}"

if [ ! -f "$IMG" ]; then
    echo "❌ Image file '$IMG' not found."
    exit 1
fi

mkdir -p "$DEST"

echo "📂 Extracting all files from $IMG to $DEST ..."
os9 copy -rl "$IMG",/ "$DEST"

if [ $? -eq 0 ]; then
    echo "✅ Extraction completed successfully."
else
    echo "❌ Extraction failed."
fi

