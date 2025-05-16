contract TestParenthesesPrecedence {
    receive() {
        let without_parens: Int = 3 + 4 * 2;    // should be 3 + (4*2) = 11
        let with_parens: Int = (3 + 4) * 2;       // should be (3+4)*2 = 14
        dump(without_parens);
        dump(with_parens);
    }
}
