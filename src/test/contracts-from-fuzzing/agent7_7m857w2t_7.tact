/// Test Snippet 11: Valid arrangement reversing parameters

// This function uses an explicit argument arrangement, swapping the order in which parameters are pushed onto the stack.
// With parameters a and b, normally they are pushed as [a, b] (a at bottom, b at top). With arrangement 'asm(b a)',
// the parameters are pushed as [b, a]. The body then performs a SWAP, swapping the top two values, resulting in [a, b],
// and then ADD adds them, resulting in a + b. Thus, the final result should be the sum of a and b.

asm(b a) fun reverseParams(a: Int, b: Int): Int { SWAP ADD }

fun main() {
    let result = reverseParams(7, 8); // Expected: 15
}
