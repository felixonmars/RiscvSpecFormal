#!/bin/bash

dir=$1
xlen=$2

allfilesp=$(find "$dir" -maxdepth 1 -regex ".*/rv$xlen[um].-p[^\.]*")
allfilesv=$(find "$dir" -maxdepth 1 -regex ".*/rv$xlen[um].-v[^\.]*")

allfiles="$allfilesp $allfilesv"

for file in $allfiles
do
  for badfile in \
    rv32mi-p-breakpoint \
    rv64mi-p-breakpoint
  do
    insert=1
    if [[ $file == "$dir/$badfile" ]]
    then
      insert=0
      break
    fi
  done
  if [[ $insert == 1 ]]
  then
    files=$(printf "$files\n$file")
  fi
done
echo "$files"
