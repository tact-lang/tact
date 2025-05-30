contract TestBitwisePrecedence() {
    fun test() {
        // Testing bitwise and negation operator precedence
        // ~5 should be -6; -5 is -5, so ~5 + -5 should be -11
        dump(~5 + -5); // expected output: -11
    }

    receive() {
        self.test();
        cashback(sender());
    }
}
