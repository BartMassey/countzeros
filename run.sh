#!/bin/sh
# Copyright © 2015 Bart Massey
# [This program is licensed under the "MIT License"]
# Please see the file COPYING in the source
# distribution of this software for license terms.
# Count zero and one bits over many files

find $1 -xdev -type f -print0 |
xargs -0 sh ./run1.sh |
./process.py
