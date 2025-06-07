contract TestParenthesesPrecedence {
    receive() {
        // Parenthesized expressions and operator precedence
        let val1: Int = (1 + 2) * (3 + 4);    // expected 21
        let val2: Int = 1 + 2 * 3 + 4;          // expected 11 (2*3=6, 1+6+4=11)
        let val3: Bool = ((false || true) && false); // expected false
        let val4: Int = (((1)));               // expected 1
    }
}
