# Experience doc

## Construct mappings

- `x: bit<10>` => `int10 x[10]` (int10 not a valid C type?)
- `a...[10 bank 5]` => `#pragma HLS ARRAY_PARTITION variable=a factor=5`
- declaring a variable outside of a function => parameter of the kernel function
- a statement outside a function => statement in the kernel function
- `unroll x` (after loop guard) => `#pragma HLS UNROLL factor=32`
- `a[i][j]` => `a[(i+(x*j))]`, where `x` is unrolling factor (which should match bank number for `a`)

## Things that fail

- Can't add an idx and a static int to form an index into a paritioned array.
- Banking factor needs to be equal to unrolling factor
- Can't unroll if using an unbanked array

## what

- `//combiner:`?
- `int10`?
