#!/bin/bash
echo 'Compiler loaded'
function compile() {
  filename=$(basename "$1" .cpp)
  g++ "$1" -o "output/$filename"

  today=$(date +%Y-%m-%d_%H:%M:%S)
  log_name="${filename}_${today}.log"

  ./output/$filename | tee -a ./logs/$log_name 2>&1
  rm  "./output/$filename"
}

export compile
