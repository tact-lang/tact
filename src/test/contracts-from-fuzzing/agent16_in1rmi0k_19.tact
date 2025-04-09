contract TestParentheses {
    receive() {
        // Testing nested parentheses and operator precedence
        let result: Int = (5 * (2 + 3)) - 1; // (5 * 5) - 1 = 24
    }
}
