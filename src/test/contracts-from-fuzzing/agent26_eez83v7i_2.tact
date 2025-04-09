contract ExprTest {
    // This function tests a single expression: the arithmetic right shift operator.
    // According to the Tact docs, 5 >> 2 (with 5 as Int and >> as arithmetic right shift) should yield 1.
    fun test() {
        // Dump the result of the expression (should be 1)
        dump(5 >> 2);
    }

    // To ensure that test() is definitely compiled, we call it from a receiver using self.
    receive() {
        self.test();
    }
}
