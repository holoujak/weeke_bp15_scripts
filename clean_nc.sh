#!/bin/bash

if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <input_file>"
    exit 1
fi

INPUT_FILE="$1"
OUTPUT_FILE="${INPUT_FILE}_filtered"

# Filter only standard G-code commands
grep -E "^(N[0-9]+ (G|M|F|S|X|Y|Z|P|;|\(|\*|%))" "$INPUT_FILE" > "$OUTPUT_FILE"

echo "Filtering completed. The filtered file is saved as $OUTPUT_FILE."
