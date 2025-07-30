contract ExprDivisionRounding {
    fun test() {
        // Testing division with rounding toward -∞
        dump(3 / 2);    // expected: 1
        dump(3 / -2);   // expected: -2 (3 / -2 = -1.5 -> -2)
        dump(-3 / 2);   // expected: -2 (-3 / 2 = -1.5 -> -2)
        dump(-3 / -2);  // expected: 1
    }

    receive() {
        self.test();
    }
}
