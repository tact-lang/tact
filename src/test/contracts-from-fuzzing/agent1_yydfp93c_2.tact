contract Test {
    // This function tests an arithmetic expression with integer literals
    fun test_arithmetic(): Int {
        // As per operator precedence, multiplication is computed before addition.
        // Expected: 1 + (2 * 3) = 7
        return 1 + 2 * 3;
    }

    receive() {
        // Call the test function via self
        dump(self.test_arithmetic());
    }
}
