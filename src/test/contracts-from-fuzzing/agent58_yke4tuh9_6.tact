contract TestHalfTon() {
    // Testing compile-time evaluation of ton built-in function with fractional value "0.5"
    // Expectation: 0.5 Toncoin = 500,000,000 nanoToncoins
    const HALF_TON: Int = ton("0.5");

    receive() {
        dump(self.HALF_TON); // Expected output: 500000000
    }
}
