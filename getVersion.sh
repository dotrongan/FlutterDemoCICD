#!/bin/bash

ver=""

IFS=$'\n'
for line in `cat pubspec.yaml`; do
  if [[ "$line" == "version: "* ]]; then
    ver=${line:9}
  fi
done

export VERSION=$ver
