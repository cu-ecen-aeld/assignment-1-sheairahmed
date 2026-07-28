#!/bin/bash

set -e

if [[ $# -ne 2 ]]; then
    echo "Error: Two argument required."
    echo "Usage: $0 <writefile> <writestr>"
    exit 1
fi

writefile=$1
writestr=$2

writedir=$(dirname "$writefile")

mkdir -p "$writedir"
if [[ $? -ne 0 ]]; then
    echo "Error: Could not create directory $writedir"
    exit 1
fi

echo "$writestr" > "$writefile"
if [[ $? -ne 0 ]]; then
    echo "Error: Could not create file $writefile"
    exit 1
fi

exit 0
