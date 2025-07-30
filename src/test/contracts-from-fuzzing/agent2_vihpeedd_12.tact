contract TestPrecedence {
    receive() {
        // Test operator precedence with parentheses and binary operations
        let a: Int = 5 + 3 * 2;    // 5 + (3 * 2) = 11
        let b: Int = (5 + 3) * 2;    // (5 + 3) * 2 = 16
        let c: Bool = (5 + 3) == 8;  // evaluates to true
    }
}
