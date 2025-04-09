contract Test {
    // Test the compile-time function ton() for converting a human-readable Toncoin value to nanoToncoins.
    // According to documentation, ton("1") should yield 1000000000 (1e9) nanoToncoins.
    one: Int = ton("1");

    receive() {
        dump(self.one); // Expected output: 1000000000
    }
}
