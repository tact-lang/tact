contract TestAscii() {
    // Constant computed at compile time using the built-in ascii function
    // Expected value: 14850721 (for the lightning bolt emoji, ⚡)
    const AS_INT: Int = ascii("⚡");

    fun runTest() {
        // Dump the constant value; accessed as self.AS_INT
        dump(self.AS_INT);
    }

    receive() {
        self.runTest();
    }
}
