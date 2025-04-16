contract TestConstants() {
    // Constant evaluation using compile-time built-in functions
    // Expected: ton("1") produces 1000000000 (1 Toncoin in nanoToncoins)
    // and ascii("⚡") produces 14850721
    const TON_VALUE: Int = ton("1");
    const ASCII_VALUE: Int = ascii("⚡");

    fun check() {
        // Dump the constant values using self references
        dump(self.TON_VALUE);     // Expected dump: 1000000000
        dump(self.ASCII_VALUE);   // Expected dump: 14850721
    }

    receive() {
        self.check();
    }
}
