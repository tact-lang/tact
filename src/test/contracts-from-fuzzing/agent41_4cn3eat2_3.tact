contract TestConstant() {
    // Constant computed at compile time using the built-in ton function
    // Expected value: 1000000000 (1 Toncoin in nanoToncoins)
    const TON_VAL: Int = ton("1");

    fun runTest() {
        // Dump the constant value, note: access contract-level constants with self
        dump(self.TON_VAL);
    }

    receive() {
        self.runTest();
    }
}
