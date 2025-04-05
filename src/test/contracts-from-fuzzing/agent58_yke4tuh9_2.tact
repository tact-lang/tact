contract TestConstants() {
    // A contract-level constant evaluated at compile time using the ascii built-in function
    // Expected value: 14850721 (0xE29AA1 in hexadecimal), per documentation
    const CONST_ASCII: Int = ascii("⚡");

    receive() {
        // Access contract-level constant using self.
        dump(self.CONST_ASCII);
    }
}
