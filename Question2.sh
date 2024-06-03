#!/bin/bash

directoryPath=$1

if [ -d $directoryPath ]; then
    echo "Directory exists"
else
    echo "Directory does not exist"
    exit 1
fi

# create a set to store the extension of files
extensions=("py" "cpp" "sh" "js" "txt" "pdf")

declare -A fileExtensionCount

# Initialize counts to 0 for all specified extensions
for ext in "${extensions[@]}"; do
    fileExtensionCount[$ext]=0
done

for file in $(find $directoryPath -type f -not -path '*/\.*'); do
    extension=$(echo $file | rev | cut -d'.' -f1 | rev)
    if [ -n "${fileExtensionCount[$extension]}" ]; then
        fileExtensionCount[$extension]=$((${fileExtensionCount[$extension]} + 1))
    fi
done


for key in "${extensions[@]}"; do
    echo "Extension: $key, Count: ${fileExtensionCount[$key]}"
done

echo -e "$output" | sort
