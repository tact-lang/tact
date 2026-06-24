/// Correct test: use only parameter rearrangement (no return rearrangement) for adding two numbers
asm(b a) fun addReverse(a: Int, b: Int): Int { ADD }

fun main() {
    let r = addReverse(40, 2); // Expected: 42
}
