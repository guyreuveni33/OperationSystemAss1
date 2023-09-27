#!/bin/bash
#Guy Reuveni 206398596

# Check if the script was given two arguments
validParametersNum() {
  if [ "$#" -lt 2 ]; then
    echo "Not enough parameters"
    exit 1
  fi
}

# Delete all .out files in the specified directory
outfilesdelete() {
  find "$1" -maxdepth 1 -name "*.out" -delete
}

# Compile all .c files in the specified directory that contain the specified word
compilefiles() {
  for file in "$1"/*.c; do
    if grep -i -q "\b${word}\b" "$file"; then
      gcc -o "${file%.c}.out" "$file"
    fi
  done
}

# Get the directory and word arguments
directory=$1
word=$2

# Check the parameters
validParametersNum "$@"

# Delete any existing output files
outfilesdelete "$directory"

# Compile the files
compilefiles "$directory" "$word"

if [ $# -eq 3 ]; then
  recursive="$3"

  if [ $recursive = "-r" ]; then
    for subFolder in "$directory"/*; do
      if [ -d "$subFolder" ]; then
        "$0" "$subFolder" "$word" -r
      fi
    done
  fi
fi