contract TestPrecedence {
    receive() {
        // Testing operator precedence with parenthesized expressions
        let a: Int = 2 + 3 * 4;   // Expected: 2 + (3*4) = 14
        let b: Int = (2 + 3) * 4; // Expected: (2+3)*4 = 20
        dump(a);
        dump(b);
    }
}
