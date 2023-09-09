#!/bin/bash

if [ "$#" == 0 ]; then
    echo "$#"
    echo "Error: Atleast one argument is required. Which is the path to the git repository."
    exit 1
elif [ ! -d $1 ]; then
    echo "Error: The path provided is not a directory."
    exit 1
else
    cd $1
    for arg in "${@:2}"; do
        count=$(grep -r -c "<$arg" | awk -F ':' '{sum+=$2} END {print sum}')
        echo "$arg - $count" >> ../output2.txt
    done
fi