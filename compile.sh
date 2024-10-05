#!/bin/bash
echo 'Compiler loaded'
function compile() {
  filename=$(basename "$1" .cpp)
  g++ "$1" -o "outputs/$filename"
  ./outputs/$filename > "outputs/$filename.out"
  cat "outputs/$filename.out"
  rm  -rf ./outputs
}

export compile
