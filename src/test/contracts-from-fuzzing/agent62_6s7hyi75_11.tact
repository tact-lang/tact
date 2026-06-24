contract TestPrecedence {
    receive() {
        // Testing operator precedence and parenthesized expressions
        let a: Int = 2 + 3 * 4;       // Expected 2 + (3*4) = 14
        dump(a);
        let b: Int = (2 + 3) * 4;       // Expected (2+3)*4 = 20
        dump(b);

        // Testing nested parenthesized expressions with unary operators
        let c: Int = - (2 + 3) * 2;     // Expected - (5*2) = -10
        dump(c);
    }
}
