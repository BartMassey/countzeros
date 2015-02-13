#!/bin/sh
# Copyright © 2015 Bart Massey
# [This program is licensed under the "MIT License"]
# Please see the file COPYING in the source
# distribution of this software for license terms.
# Count zero and one bits over specified files

for F in "$@"
do
    ./countzeros <"$F"
done
