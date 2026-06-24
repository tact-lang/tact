contract TestAscii() {
    // Test compile-time evaluation of the ascii() built-in function
    // Expected: ascii("⚡") evaluates to an integer representing the UTF-8 bytes of ⚡, which is 14850721
    const A: Int = ascii("⚡");

    receive() {
        dump(self.A);
    }
}
