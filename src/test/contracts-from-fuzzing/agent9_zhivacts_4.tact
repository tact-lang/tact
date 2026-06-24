/* Test3: swapPair to test parameter ordering with SWAP */
struct Pair { a: Int; b: Int }

asm fun swapPair(a: Int, b: Int): Pair { 
    SWAP 
}

fun testSwap() {
    let p = swapPair(11, 22);
    // Expected: p.a = 22, p.b = 11
}
