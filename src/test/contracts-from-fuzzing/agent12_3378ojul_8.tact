/// Test complex assembly function with multiple TVM instructions
/// This function takes two integers, duplicates the top value, and adds them in a particular order.
asm fun sumDouble(x: Int, y: Int): Int {
    // Initial stack: [x, y] (x bottom, y top)
    DUP         // Duplicate the top element y: stack becomes [x, y, y]
    SWAP        // Swap the top two elements (swapping y and y, no effective change): stack remains [x, y, y]
    ADD         // Pop top two: computes y + y, leaving: [x, 2*y]
    ADD         // Pop top two: computes x + 2*y, leaving this as result
}

fun main() {
    let result = sumDouble(10, 16); // Expected: 10 + 2*16 = 42
}
