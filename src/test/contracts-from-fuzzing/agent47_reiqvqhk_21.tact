contract FuzzNestedLoopReturnTest {
    // Returns the product of a and b if their sum exceeds 10 in any nested loop iteration,
    // otherwise returns 0.
    fun nestedLoopReturn(a: Int, b: Int): Int {
        repeat (a) {
            repeat (b) {
                if (a + b > 10) {
                    return a * b;
                }
            }
        }
        return 0;
    }
}
