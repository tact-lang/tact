contract TestParenthesesPrec {
    receive() {
        // Testing operator precedence without vs with parentheses
        let a: Int = 5 * 5 - 2;   // Expected: 23
        let b: Int = 5 * (5 - 2); // Expected: 15
    }
}
