#!/bin/bash

set -e

if [[ $# -ne 2 ]]; then
    echo "Error: two argument required."
    echo "Usage: $0 <filesdir> <searchstr>"
    exit 1
fi

filesdir=$1
searchstr=$2

if [[ ! -d "$filesdir" ]]; then
    echo "Error: $filesdir is not a directory on the filesystem"
    exit 1
fi

numfiles=$(find "$filesdir" -type f | wc -l)
matchinglines=$(grep -r "$searchstr" "$filesdir" 2>/dev/null | wc -l)

echo "The number of files are $numfiles and the number of matching lines are $matchinglines"

exit 0
