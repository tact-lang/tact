contract TestPrecedenceAmbiguity {
    receive() {
        // Testing ambiguous precedence: according to operator precedence, addition should be evaluated before bitwise shift
        // Expect: (2 + 3) << 1 = 5 << 1 = 10
        let r1: Int = 2 + 3 << 1;
        dump(r1);
    }
}
