#!/bin/bash

if [ "$#" -ne 1 ]; then
    echo "Usage: ./prep /path/to/libressl/root"
    exit
fi
clang -xc -E module.modulemap.template -o module.modulemap.txt -D INCLUDE_ROOT=$1

sed '/^#/ d' module.modulemap.txt > module.modulemap
