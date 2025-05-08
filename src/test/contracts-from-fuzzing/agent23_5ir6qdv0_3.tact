/* Test 1: Valid asm function (push42) - already implicitly tested above */
asm fun answer(): Int { 42 PUSHINT }

/* Test 2: Swap arrangement test: using argument arrangement to swap two Ints */

struct Pair { first: Int; second: Int }

asm(b a) fun swap(a: Int, b: Int): Pair { SWAP }

fun testSwap() : Pair {
    return swap(10, 20);
}
