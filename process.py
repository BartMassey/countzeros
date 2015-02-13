#!/usr/bin/python3
# Copyright © 2015 Bart Massey
# [This program is licensed under the "MIT License"]
# Please see the file COPYING in the source
# distribution of this software for license terms.
# Compute the mean over files, variance over files, and mean over bytes
# for countzeros

from sys import stdin, stderr
from math import sqrt

# Knuth online variance algorithm from:
#   http://en.wikipedia.org/wiki/Algorithms_for_calculating_variance
n = 0
z = 0
o = 0
mean = 0.0
m2 = 0.0
for line in stdin:
    fields = line.split(" ")
    if len(fields) != 3:
        continue
    n += 1
    z += int(fields[0])
    o += int(fields[1])
    x = float(fields[2])
    delta = x - mean
    mean += delta / n
    m2 += delta * (x - mean)
if n > 2:
    print("%d %g %g %g" % (n, mean, sqrt(m2 / (n - 1)), z / (z + o)))
