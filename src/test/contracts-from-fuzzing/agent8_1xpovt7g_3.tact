contract TestTon() {
    // Test constant evaluation for the compile-time function ton
    // Expected: 1 Toncoin = 1_000_000_000 nanoToncoins
    const T: Int = ton("1");

    receive() {
        require(self.T == 1000000000, "ton constant mismatch");
        cashback(sender());
    }
}
