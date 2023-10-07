#!/bin/bash
filesdir=$1
searchstr=$2

if [ -z "$filesdir" -o -z "$searchstr" ]; then
 echo "one or both vars are not specified"
 exit 1
else
 if ! [ -d ${filesdir} ]; then
	echo "${filesdir} is not a directory"
        exit 1
 fi 
fi

files=$( find ${filesdir} -type f ) 
nrfiles=$( ${files} | wc -w)
lines=$( ${files} -exec grep both {} + | wc -w)
echo "The number of files are ${nrfiles} and the number of matching lines are ${lines}" 
