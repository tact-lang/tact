contract TestAscii {
    // Test compile-time evaluation of ascii() built-in function
    // Expected: 14850721 (0xE29AA1), as mentioned in the docs
    const POWER: Int = ascii("⚡");

    receive() {
        require(self.POWER == 14850721, "ascii constant evaluation failed");
        cashback(sender());
    }
}
