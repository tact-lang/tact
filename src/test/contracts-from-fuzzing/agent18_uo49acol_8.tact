contract TestIntegerDivision() {
    fun test() {
        // According to documentation, division rounds toward -∞
        // Expected: 3 / 2 = 1, and (-3) / 2 = -2
        let a: Int = 3 / 2;  // expected 1
        let b: Int = (-3) / 2; // expected -2
        dump(a);
        dump(b);
    }

    receive() {
        self.test();
    }
}
