#!/bin/bash

if [[ "$#" -ne 1 ]]; then
    echo 'Usage: ./conf.sh /path/to/libressl'
    exit
fi
___path___=$1
#source = $(cat "$PWD/module.modulemap.template")
#cat source
template="$PWD/module.modulemap.template"
source=$(cat ${template})
result=${source//INCLUDE_ROOT/$___path___}
echo $result > "$PWD/module.modulemap"
sed -i -e 's/EXPORT_STAR/*/g' "$PWD/module.modulemap"
