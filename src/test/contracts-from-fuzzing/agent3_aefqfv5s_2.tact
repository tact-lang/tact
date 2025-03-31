/* Test 2: Assembly function using structure flattening for parameters */
struct Pair { a: Int; b: Int }

asm fun addPair(p: Pair): Int { ADD }

// This function should take a Pair (flattened as two ints on stack: a then b),
// then ADD pops them and pushes the sum, which is captured as Int.