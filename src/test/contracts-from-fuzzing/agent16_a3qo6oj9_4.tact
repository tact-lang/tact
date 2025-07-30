struct Pair { first: Int; second: Int }

// Testing argument and return arrangement: swap_pair should swap two integers
asm(a b -> 1 0) fun swap_pair(a: Int, b: Int): Pair { SWAP }

fun main() {
    let p = swap_pair(10, 20); // expected: Pair { first: 20, second: 10 }
}
