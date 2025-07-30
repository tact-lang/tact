contract TestDivision {
    fun showcase() {
        // Test division operator rounding towards -∞.
        // According to documentation, 3/2 should evaluate to 1, and -3/2 should evaluate to -2.
        dump(3 / 2);  // expected output: 1
        dump(-3 / 2); // expected output: -2
    }

    receive() {
        self.showcase();
    }
}