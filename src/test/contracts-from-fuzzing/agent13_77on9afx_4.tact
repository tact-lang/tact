contract TestTon() {
    // Testing compile-time evaluation of ton() built-in function
    // According to documentation, ton("1") should produce 1000000000
    const TEST_TON: Int = ton("1");

    fun runTest() {
        dump(self.TEST_TON == 1000000000);
    }

    receive() {
        self.runTest();
        cashback(sender());
    }
}
