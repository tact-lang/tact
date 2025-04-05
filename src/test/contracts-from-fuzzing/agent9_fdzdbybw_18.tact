contract TestDivision {
    fun test() {
        // Testing division operator rounding behavior
        // According to docs, division rounds toward -∞
        let a = 3 / 2;   // Expected: 1
        dump(a);

        let b = -3 / 2;  // Expected: -2 (floor division rounding toward -∞)
        dump(b);
    }

    receive() {
         self.test();
    }
}
