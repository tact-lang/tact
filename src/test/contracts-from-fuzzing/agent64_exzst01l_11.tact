contract TestParentheses {
    receive() {
        // Testing operator precedence with and without parentheses
        let a: Int = 1 + 2 * 3;     // Expected 7, as multiplication has higher precedence
        let b: Int = (1 + 2) * 3;   // Expected 9, as addition is forced to happen before multiplication
        dump(a);
        dump(b);
    }
}
