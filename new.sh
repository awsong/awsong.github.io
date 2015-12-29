#!/bin/sh
DATE=`date +%Y-%m-%d`
TITLE=`echo $1 | sed "s/ /-/g"`

cat  > _posts/$DATE-$TITLE.md << EOF
---
layout: post
title: $1
---
EOF
