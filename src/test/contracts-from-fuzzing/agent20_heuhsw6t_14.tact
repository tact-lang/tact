contract TestDivisionRounding {
    fun showcase() {
        // Testing division rounding behavior
        let a: Int = 3 / 2;           // expected: 1
        let b: Int = -3 / 2;          // expected: -2 (rounding toward -∞)
        let c: Int = 1 % -5;          // expected: -4 (as per documentation)
        dump(a);
        dump(b);
        dump(c);
    }

    receive() {
        self.showcase();
    }
}
