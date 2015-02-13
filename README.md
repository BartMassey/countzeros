# countzeros
Copyright © 2015 Bart Massey

This little software suite counts the number of zero and one
bits in a collection of files. It consists of several parts:

* `countzeros.c` is the core fast bit-counter which reads
  standard input.

* `run1.sh` runs `countzeros` on each of its command-line arguments.

* There are three versions of the statistics processor that
  analyzes the per-file statistics for mean and standard
  deviation.

  * `process.py` is in Python 3. This is the default.

  * `process.awk` is in AWK. Unfortunately, for very large
    collections of large files the lack of
    arbitrary-precision integers makes AWK behave badly.

  * `process.5c` is in [Nickle](http://nickle.org). This
    language is probably best because 256-bit default floating
    mantissa, but it is not widely used or known.

* `run.sh` orchestrates the test. Invoke it with one
   argument: the root of the directory tree you want
   to gather statistics on. Currently, it will not leave
   its target filesystem looking for files.

This program is licensed under the "MIT License".  Please
see the file COPYING in the source for license information.
