struct Pair { first: Int; second: Int }

// This assembly function uses argument arrangement to swap parameters
asm(a b -> 1 0) fun swap(a: Int, b: Int): Pair { }

fun main() {
    let res = swap(10, 20);
    // Expected: res.first = 20, res.second = 10
}