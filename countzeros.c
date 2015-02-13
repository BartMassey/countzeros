/* Report the number of zero bits, the number of one bits,
   and the ratio of zero to total bits for a file. */

/*
 * Copyright © 2015 Bart Massey
 * [This program is licensed under the "MIT License"]
 * Please see the file COPYING in the source
 * distribution of this software for license terms.
 */

#include <stdio.h>
#include <stdint.h>
#include <inttypes.h>

static int popcount_table[256];

inline static int popcount_byte(int byte) {
    int ones = 0;
    for (int i = 0; i < 8; i++)
        ones += (byte >> i) & 1;
    return ones;
}

static void build_popcount_table(void) {
    for (int i = 0; i < 256; i++)
        popcount_table[i] = popcount_byte(i);
}


int main() {
    int byte;
    uint64_t zeros = 0;
    uint64_t ones = 0;
    build_popcount_table();
    while((byte = getchar()) != EOF) {
        int byte_ones = popcount_table[byte];
        int byte_zeros = 8 - byte_ones;
        zeros += byte_zeros;
        ones += byte_ones;
    }
    if (zeros + ones > 0)
        printf("%" PRIu64 " %" PRIu64 " %g\n",
               zeros, ones, (double) zeros / (zeros + ones));
    return 0;
}
