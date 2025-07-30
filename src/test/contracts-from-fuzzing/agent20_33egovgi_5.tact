contract ConstMultTest() {
    // Multiply 1 Toncoin (in nanoToncoin units) with ascii("⚡") constant.
    // Expected: 1000000000 * 14850721
    const MULT: Int = ton("1") * ascii("⚡");

    // Precomputed expected result
    // 1000000000 * 14850721 = 14850721000000000
    const EXPECTED: Int = 14850721000000000;

    receive() {
        require(self.MULT == self.EXPECTED, "Multiplication of constants failed");
        cashback(sender());
    }
}
