# Copyright © 2015 Bart Massey
# [This program is licensed under the "MIT License"]
# Please see the file COPYING in the source
# distribution of this software for license terms.

CFLAGS = -O4 -Wall -std=c99

countzeros: countzeros.c
	$(CC) $(CFLAGS) -o countzeros countzeros.c

clean:
	-rm -f countzeros
