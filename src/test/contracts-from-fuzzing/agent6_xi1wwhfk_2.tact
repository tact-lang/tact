contract TestExpr() {
    fun test() {
        // Testing operator precedence for arithmetic operators
        // Expected: 5 + 4 - (5 * 4 / 5 % 4) evaluates to 9
        dump(5 + 4 - 5 * 4 / 5 % 4);
    }

    // A receiver function to ensure full compilation
    receive() {
        self.test();
        // Use cashback to handle the message,
        // though not relevant for the test
        cashback(sender());
    }
}
