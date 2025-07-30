// Test 2: Test asm function with SWAP and DROP to manipulate stack
// This test uses two TVM instructions to swap and drop values.
asm fun swapDrop(a: Int, b: Int): Int {
    // Pushes arguments in order: a then b from parameter passing, so stack: [a, b] with b on top
    // SWAP will swap them: stack becomes [b, a]
    SWAP
    // DROP drops the top (which is now a), so remaining value is b
    DROP
    // Captures the top of the stack (b) as the return value
}

fun main() {
    let res: Int = swapDrop(123, 456);
    // Expected result: 456
}
