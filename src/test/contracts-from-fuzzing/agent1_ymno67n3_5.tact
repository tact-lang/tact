/* Test 5: Arrangement test using return arrangement to swap values captured into a Pair struct */

struct Pair { first: Int; second: Int }

// Using return arrangement to swap the order of the stack values
asm(-> 1 0) fun swapArr(a: Int, b: Int): Pair { SWAP }

fun testSwapArr(): Pair {
    return swapArr(1, 2);
}
