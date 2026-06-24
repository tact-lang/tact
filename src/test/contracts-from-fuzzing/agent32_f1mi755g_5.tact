contract TestTonHalf() {
    // Test constant evaluation of the ton compile-time function for fractional input
    // Expected: ton("0.5") produces 500000000 (half Toncoin, in nanoToncoins)
    const TON_HALF: Int = ton("0.5");

    receive() {
        dump(self.TON_HALF); // Expected dump output: 500000000
    }
}
