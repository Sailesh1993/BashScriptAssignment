#!/bin/bash

if [ "$#" == 0 ]; then
    echo "$#"
    echo "Error: At least one argument is required, which is a name of a country"
    exit 1
else
    for arg in "$@"; do
        curl -s "https://restcountries.com/v3.1/name/${arg}" | jq -r '.[0] | "Name: \(.name.common)\nCapital: \(.capital)\nLanguages: \(.languages | join(", "))\nPopulation: \(.population)\n\n"' >> output3.txt
    done
fi
