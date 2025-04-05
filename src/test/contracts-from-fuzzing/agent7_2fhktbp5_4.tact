contract TestUnaryNegation {
    receive() {
        // Unary negation tests
        let a: Int = -(-1);      // Expected: 1
        let b: Int = --1;         // Expected: 1 (double negation)
        let c: Int = -5 + -(-5);  // Expected: 0
    }
}
