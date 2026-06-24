/* Test 5: Using return arrangement to swap return order
   The function takes two ints, and returns a Pair struct with fields arranged such that the top two values are swapped.
*/

struct Pair { a: Int; b: Int }

asm(-> 1 0) fun swapPair(a: Int, b: Int): Pair { SWAP }