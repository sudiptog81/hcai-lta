
#!/bin/bash

source_dir="../data/cbp-lkg/data/LEGAL_TEXT/"
destination_dir="../results/case-similarity-text/for-summarization"

mkdir -p "$destination_dir"

for file in "$source_dir"/*.txt; do
    filename=$(basename -- "$file")
    destination_path="$destination_dir/$filename"
    cat "$file" | ag "\S" | head -n 50 | tail -n +20 >> "$destination_path"
    if [ "$(wc -l < "$source_dir$filename")" -gt 30 ]; then
      cat "$file" | ag "\S" | tail -n 20 | head -n -4 >> "$destination_path"
    fi
    echo "Wrote $destination_path ..."
done
