contract ConstFractionTon() {
    // Test compile-time evaluation of ton() with a fractional string.
    // According to documentation: ton("1") is 10^9 nanoToncoins, so ton("0.5") should be 500000000.
    const HALF: Int = ton("0.5");

    receive() {
        require(self.HALF == 500000000, "ton('0.5') did not evaluate to 500000000");
        cashback(sender());
    }
}
