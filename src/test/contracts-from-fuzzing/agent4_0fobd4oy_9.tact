contract ExprUnaryTest {
    fun testUnary() {
        let five: Int = 5;
        // Negation: -5
        let neg: Int = -five;
        // Bitwise NOT: ~5, expected: -6 (since ~5 equals -(5+1))
        let bitNot: Int = ~five;
        // Combination: -(~five) should be 6 because ~five = -6, then -(-6) = 6
        let comb1: Int = -(~five);
        // Combination: ~(-five) should be 4 because -five = -5, then ~(-5) = 4
        let comb2: Int = ~(-five);

        dump(neg);     // Expected: -5
        dump(bitNot);  // Expected: -6
        dump(comb1);   // Expected: 6
        dump(comb2);   // Expected: 4
    }

    receive() {
        self.testUnary();
    }
}
