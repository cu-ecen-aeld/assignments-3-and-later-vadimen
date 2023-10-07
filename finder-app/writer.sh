#!/bin/bash
writefile=$1
writestr=$2

if [ -z "$writefile" -o -z "$writestr" ]; then
 echo "one or both vars are not specified"
 exit 1
fi

mkdir -p "$(dirname "$writefile")"
echo "$writestr" > "$writefile"

if ! [ $? -eq 0 ]; then 
 echo "failed to write into file"
 exit 1
fi
