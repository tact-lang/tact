asm(a b -> 1 0) fun swapArgs(a: Int, b: Int): Ret { SWAP }

struct Ret { first: Int; second: Int }

fun testSwap() {
    // Calling swapArgs should swap the two integer arguments
    let r: Ret = swapArgs(100, 200);
    // r.first should be 200 and r.second should be 100
}
