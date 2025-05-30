contract TestTonEdge {
    // Test the edge-case evaluation of ton("0").
    // According to documentation, ton("0") should yield 0 nanoToncoins.
    const ZERO_TON: Int = ton("0");

    receive() {
        dump(self.ZERO_TON);
    }
}
