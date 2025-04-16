// Test 5: asm function using arrangements to swap arguments
// Here the parameters are declared in order (len, s) but the arrangement 's len -> 1 0' swaps them on the stack

struct Pair { a: Int; b: Int }

asm(s len -> 1 0) fun swapArgs(len: Int, s: Int): Pair { SWAP }

fun main() {
    // When calling swapArgs(1, 2), the arrangement causes 2 to be at the bottom (captured as a) and 1 on top (captured as b).
    // So Pair { a: 2, b: 1 } is expected.
    let p: Pair = swapArgs(1, 2);
}
