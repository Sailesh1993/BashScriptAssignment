#!/bin/bash

# use control flow to check the number of arguments
if [ "$#" == 0 ];
then
    echo "Error: File path is missing"
    exit 1
elif [ "$#" == 1 ];
then 
    cd $1
    git shortlog -sn > ../output1.txt
else
    cd $1
    for name in "$@" ; do
        git shortlog -sn | grep "$name" >> ../output1.txt
    done
fi