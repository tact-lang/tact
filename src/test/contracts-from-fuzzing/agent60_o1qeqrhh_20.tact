contract TestPrecedence {
    receive() {
        // Test operator precedence and unary vs binary interpretation
        dump(5 + -5); // Expected 0: plus with unary minus
        dump(5 - 5);  // Expected 0: subtraction
    }
}
