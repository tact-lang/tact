contract ExprNullTest {
    fun testNull() {
        // Testing the null literal
        let maybeInt: Int? = null;
        // Use conditional to determine if maybeInt is null
        if (maybeInt == null) {
            dump(1); // Expected output: 1 (true condition)
        } else {
            dump(0);
        }
    }

    receive() {
        self.testNull();
    }
}
