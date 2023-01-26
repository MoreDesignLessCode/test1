#!/usr/bin/env bash

# Accept all required parameters
while getopts n:o flag
do
    case "${flag}" in        
        n) name=${OPTARG};;
        o) object=${OPTARG};;
    esac
done

echo "Project Name: $name";
echo "Object name: $object";

echo "Renaming begins..."

original_name="project_name"
original_object="project_object"

# for filename in $(find . -name "*.*") 
for filename in $(git ls-files) 
do
    sed -i "s/$original_name/$name/g" $filename
    sed -i "s/$original_object/$object/g" $filename
    echo "Renamed $filename"
done

#mv project_name $name
