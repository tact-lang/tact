contract TestAscii {
    // Test constant evaluation of the built-in ascii function
    // Expected: ascii("⚡") should yield 14850721
    const ASCII: Int = ascii("⚡");

    receive() {
        let result = self.ASCII;
        dump(result);
    }
}
