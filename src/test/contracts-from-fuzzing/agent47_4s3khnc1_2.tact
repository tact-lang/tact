contract TestConst() {
    // Compile-time evaluated constants using built-in functions
    // ascii("⚡") is expected to produce 14850721 (as an Int)
    const A: Int = ascii("⚡");
    
    // crc32("deadbeef") is evaluated at compile-time
    const B: Int = crc32("deadbeef");
    
    // ton("1") converts "1" ton into nanoToncoins, expected to be 1000000000
    const C: Int = ton("1");
    
    // sha256 computed at compile-time from a string literal
    const D: Int = sha256("Tact constant test");

    receive() {
        // Use self.<const> to refer to contract-level constants
        dump(self.A);  // should dump 14850721
        dump(self.B);  // dumps the crc32 result of "deadbeef"
        dump(self.C);  // should dump 1000000000
        dump(self.D);  // dumps the sha256 hash value as an Int
        cashback(sender());
    }
}
