#!/bin/sh
ppid="`ps -p "$$" -o ppid=`"
lsof -nP -p "$ppid" | awk 'NR==3 {print $NF; exit}'
