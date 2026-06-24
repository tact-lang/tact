contract TestTonFraction() {
    // Test constant evaluation for ton with fractional input
    // 0.1 Toncoin should be equal to 100,000,000 nanoToncoins
    const TFrac: Int = ton("0.1");

    receive() {
        require(self.TFrac == 100000000, "ton fraction constant mismatch");
        cashback(sender());
    }
}
