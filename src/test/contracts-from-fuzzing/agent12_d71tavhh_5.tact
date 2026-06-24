struct Pair { first: Int; second: Int }

// Test 1: Assembly function with both argument and return arrangements to swap two integers
asm(s t -> 1 0) fun swap(s: Int, t: Int): Pair { SWAP }

fun main() {
    let p: Pair = swap(100, 200);
    // p.first should be 200 and p.second should be 100
}
