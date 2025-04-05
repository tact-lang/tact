contract TestHalfTon() {
    // Test constant evaluation for ton with fractional input 0.5
    // Expected: 0.5 Toncoin = 500,000,000 nanoToncoins
    const HALF: Int = ton("0.5");

    receive() {
        require(self.HALF == 500000000, "half ton constant mismatch");
        cashback(sender());
    }
}
