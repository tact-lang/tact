contract TestOverrideTon() {
    // Testing compile-time evaluation of ton() built-in function for fractional values
    // According to documentation, ton("0.5") should produce 500000000 (i.e., 0.5 Toncoin = 500000000 nanoToncoin)
    const TEST_TON_HALF: Int = ton("0.5");

    fun runTest() {
        dump(self.TEST_TON_HALF == 500000000);
    }

    receive() {
        self.runTest();
        cashback(sender());
    }
}
