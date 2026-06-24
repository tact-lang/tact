contract TestBitwiseExpressions {
    // This test ensures correct evaluation of negation and bitwise NOT operations.
    // According to documentation:
    // - (-5) should be -5
    // - ~5 should be -6
    // - -(~5) should be 6
    // - ~(-5) should be 4
    fun test() {
        let five = 5;
        dump(-five);      // Expected output: -5
        dump(~five);      // Expected output: -6
        dump(-( ~five));  // Expected output: 6
        dump(~(-five));   // Expected output: 4
    }

    receive() {
        self.test();
    }
}
