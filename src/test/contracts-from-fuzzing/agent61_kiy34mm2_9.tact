contract TestPrecedence {
    receive() {
        let a: Int = 2 + 3 * 4;    // expected 14: 3*4 is evaluated before addition
        let b: Int = (2 + 3) * 4;  // expected 20: parentheses override operator precedence
    }
}
