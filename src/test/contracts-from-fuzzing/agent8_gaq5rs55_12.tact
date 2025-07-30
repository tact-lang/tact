contract ExprDoubleNegation {
    fun test() {
        // Testing double negation in arithmetic: 5 - -10 should result in 15
        let a = 5 - -10;
        dump(a); // expected output: 15
    }

    receive() {
        self.test();
    }
}
