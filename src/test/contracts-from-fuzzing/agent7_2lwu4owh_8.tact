contract TestOperatorPrecedence {
    fun showcase() {
        // Test arithmetic operator precedence: 
        // According to conventional operator precedence, multiplication has higher precedence than addition.
        // Therefore, 5 + 3 * 2 should evaluate as 5 + (3 * 2) = 11,
        // while (5 + 3) * 2 should evaluate as 8 * 2 = 16.
        dump(5 + 3 * 2);  // Expected output: 11
        dump((5 + 3) * 2); // Expected output: 16
    }

    receive() {
        self.showcase();
    }
}
