contract ConstBitwiseTest() {
    // Test compile-time evaluation of bitwise operators.
    // ~5 equals -6 (bitwise NOT) and -(-5) equals 5, so (~5) + (-(-5)) equals -6 + 5 = -1.
    const BITWISE: Int = (~5) + (-(-5));

    receive() {
        require(self.BITWISE == -1, "Bitwise constant evaluation error");
        cashback(sender());
    }
}
