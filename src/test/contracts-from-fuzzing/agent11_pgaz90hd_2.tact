contract TestAscii() {
    // Constant computed at compile-time using ascii built-in function
    // Expected value: 14850721 (0xE29AA1) as described in the documentation
    const VALUE: Int = ascii("⚡");

    // Receiver to ensure the contract is fully compiled and constant is accessible via self
    receive() {
        dump(self.VALUE);
    }
}
