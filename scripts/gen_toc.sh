#!/bin/bash
ls $1 | grep -v README | grep -v toc | grep -v header | sed 's/\.md//g' | \
    awk '{FMTD=$0; RAW=FMTD; gsub(/\_/, ", ", FMTD); 
         printf "1. [\"%s\"](%s.md)\n", FMTD, RAW}' > $1/toc.md;
cat $1/header.md $1/toc.md > $1/README.md;
