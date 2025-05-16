contract TestAscii() {
    // Define a constant evaluated at compile-time using the built-in ascii() function
    // According to documentation, ascii("⚡") should yield 14850721
    const A: Int = ascii("⚡");

    receive() {
        // Check that the computed constant equals 14850721
        require(self.A == 14850721, "ascii constant evaluation failed");
    }
}
