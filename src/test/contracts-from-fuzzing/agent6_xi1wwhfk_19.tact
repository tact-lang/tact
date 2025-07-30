contract TestDivision() {
    fun test() {
        // Testing integer division behavior
        // According to the documentation, division rounds toward -∞.
        // For positive numbers: 3 / 2 should yield 1.
        // For negative numbers: -3 / 2 should yield -2.
        let pos: Int = 3 / 2;  // expected 1
        let neg: Int = -3 / 2; // expected -2
        dump(pos);
        dump(neg);
    }

    receive() {
        self.test();
        cashback(sender());
    }
}
