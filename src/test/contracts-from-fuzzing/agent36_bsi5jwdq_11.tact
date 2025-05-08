contract TestParenthesesPrecedence {
    receive() {
         let a: Int = 2 + 3 * 4;   // expected: 14
         let b: Int = (2 + 3) * 4; // expected: 20
    }
}
