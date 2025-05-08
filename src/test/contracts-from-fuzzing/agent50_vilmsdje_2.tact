contract Test {
    // Test constant evaluation of the built-in function ton(), which parses a string into Toncoins.
    // Expected: ton("1") should yield 1000000000 nanoToncoins (i.e., 1 Toncoin).
    const TON: Int = ton("1");
    
    receive() {
        // Using self.TON because contract-level constants are accessed via self
        let value = self.TON;
        // Dump is only for testing, so we call it
        dump(value);
    }
}
