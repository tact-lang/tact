/* Test 3: asm swap function returning a Pair struct */

struct Pair { first: Int; second: Int }

// The asm function uses the SWAP instruction to exchange the positions of the two parameters
asm fun swap(a: Int, b: Int): Pair { SWAP }

fun testSwap(): Pair {
    return swap(10, 20);
}
