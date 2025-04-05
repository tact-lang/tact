contract TestUnaryOperators() {
    fun test() {
        // Testing unary operators: negation and bitwise NOT
        // According to documentation:
        // ~5 should be -6
        // -5 should be -5
        // -(~5) should be 6
        // ~(-5) should be 4
        dump(~5);      // expected: -6
        dump(-5);      // expected: -5
        dump(-(~5));   // expected: 6
        dump(~(-5));   // expected: 4
    }
    receive() {
        self.test();
    }
}
