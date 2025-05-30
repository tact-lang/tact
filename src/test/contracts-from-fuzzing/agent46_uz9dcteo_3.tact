contract TestAscii() {
    // Test constant evaluation of ascii built-in compile-time function
    // According to documentation, ascii("⚡") should evaluate to 14850721 (0xE29AA1)
    const A: Int = ascii("⚡");

    fun showcase() {
        // Using self.A to reference the contract-level constant
        dump(self.A);
    }

    receive() {
        self.showcase();
        return;
    }
}
