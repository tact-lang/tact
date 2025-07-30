/* Test 6: Combining argument and return arrangements
   This function takes two integers and returns a Pair struct, but the argument order is rearranged
   so that the parameters are pushed in order [b, a], and the return is rearranged swapping values via '-> 1 0'.
*/

struct Pair { a: Int; b: Int }

asm(b a -> 1 0) fun swapArgOrder(a: Int, b: Int): Pair { SWAP }