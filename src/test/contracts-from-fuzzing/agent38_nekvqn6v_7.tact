contract TestCombined {
    // Combining two compile-time functions: ton("1") and ascii("⚡")
    // Expected value: 1 Toncoin in nanoToncoins = 1000000000 plus ascii("⚡") = 14850721
    // Sum = 1000000000 + 14850721 = 1014850721
    const COMBINED: Int = ton("1") + ascii("⚡");

    receive() {
        dump(self.COMBINED);
    }
}
