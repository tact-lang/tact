contract TestConstants2() {
    // Compile-time evaluated constants
    const A: Int = ton("1");          // Expected: 1 Toncoin in nanoToncoins = 1000000000
    const B: Int = ascii("⚡");         // Expected: 14850721
    const C: Int = crc32("000DEADBEEF000"); // Expected: 1821923098
    const D: Int = 1730 + (8 | 8);        // Expected: 1730 + 8 = 1738

    receive() {
        require(self.A == 1000000000, "A mismatch: expected 1000000000");
        require(self.B == 14850721, "B mismatch: expected 14850721");
        require(self.C == 1821923098, "C mismatch: expected 1821923098");
        require(self.D == 1738, "D mismatch: expected 1738");
        // If all checks pass, refund remaining funds
        cashback(sender());
    }
}
