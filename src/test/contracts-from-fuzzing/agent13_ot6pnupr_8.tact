// Test Swap: Using SWAP in an asm extension function returning a struct Pair

struct Pair { a: Int; b: Int }

// 'swap' swaps the two integer parameters: called as extension so 'self' is first parameter
asm extends fun swap(self: Int, other: Int): Pair { SWAP }

fun main() {
    // Call swap as an extension method: 10.swap(20) should produce Pair { a: 20, b: 10 }
    let p: Pair = 10.swap(20);
}
