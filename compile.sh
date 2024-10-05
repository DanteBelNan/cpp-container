#!/bin/bash
echo 'Compiler loaded'
function compile() {
  filename=$(basename "$1" .cpp)
  g++ "$1" -o "output/$filename"
  ./output/$filename > "output/$filename.out"
  cat "output/$filename.out"
  rm  -rf ./output
  mkdir ./output
}

export compile
