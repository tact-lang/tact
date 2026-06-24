struct Pair { first: Int; second: Int }

// Test 11: Combined argument and return arrangement
asm(a b -> 1 0) fun swapPair(a: Int, b: Int): Pair { SWAP }

fun main() {
    let p = swapPair(10, 20);
}
