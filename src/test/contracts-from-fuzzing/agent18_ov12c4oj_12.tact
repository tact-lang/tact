// Test 8: Test arrangement with reversed parameters in an asm function
struct Pair { first: Int; second: Int }

// We define an asm function that swaps two parameters and returns a Pair
asm(-> 1 0) fun swap(a: Int, b: Int): Pair { SWAP }

fun main() {
    let res: Pair = swap(10, 20);
    // Expected result: first = 20, second = 10
}
