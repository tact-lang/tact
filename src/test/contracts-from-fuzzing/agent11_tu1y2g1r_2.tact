contract Test {
    // Test operator precedence in arithmetic. According to docs: 5 + 4 - 5 * 4 / 5 % 4 should yield 9.
    // Calculation: 5 * 4 = 20, 20 / 5 = 4, 4 % 4 = 0, then 5 + 4 - 0 = 9.
    fun test() {
        let result = 5 + 4 - 5 * 4 / 5 % 4;
        dump(result);
    }

    receive() {
        self.test();
    }
}
