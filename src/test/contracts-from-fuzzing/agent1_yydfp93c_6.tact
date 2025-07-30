contract TestUnaryOperators {
    // Test unary operators: negation and bitwise NOT
    // Expected: -(~5) should yield 6, as ~5 equals -6
    fun test_unary(): Int {
         let five = 5;
         return -(~five);
    }

    receive() {
         dump(self.test_unary());
    }
}
