contract TestDivisionRounding {
    fun showcase() {
        // According to the documentation,
        // the division operator rounds toward -∞.
        // For 3/2, expected result is 1.
        // For -3/2, expected result is -2, as -1.5 rounded down is -2.
        let pos = 3 / 2;
        let neg = -3 / 2;
        dump(pos); // expected: 1
        dump(neg); // expected: -2
    }
}
