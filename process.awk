#!/usr/bin/awk -f
# Copyright © 2015 Bart Massey
# [This program is licensed under the "MIT License"]
# Please see the file COPYING in the source
# distribution of this software for license terms.
# Compute the mean over files, variance over files, and mean over bytes
# for countzeros

# Knuth online variance algorithm from:
#   http://en.wikipedia.org/wiki/Algorithms_for_calculating_variance
{
    if (NF != 3)
        next
    n += 1
    z += $1
    o += $2
    x = 0.0 + $3
    delta = x - mean
    mean += delta / n
    m2 += delta * (x - mean)
}

END {
    if (n > 2)
        printf "%d %g %g %g\n", n, mean, sqrt(m2 / (n - 1)), z / (z + o)
}
