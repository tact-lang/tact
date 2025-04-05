contract TestPrecedence {
    receive() {
        let a: Int = 1 + 2 * 3;      // Expected 7 (multiplication has higher precedence)
        let b: Int = (1 + 2) * 3;      // Expected 9 (parentheses alter order)
    }
}
