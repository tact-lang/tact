contract TestConstants() {
    // Getter function that returns the sum of compile-time evaluated constants:
    // ascii("⚡") is expected to produce 14850721
    // ton("1") is expected to produce 1000000000 (1 Toncoin = 10^9 nanoToncoin)
    // crc32("000DEADBEEF000") is expected to produce 1821923098
    
    get fun test(): Int {
         let a: Int = ascii("⚡");
         let b: Int = ton("1");
         let c: Int = crc32("000DEADBEEF000");
         return a + b + c; // Expected: 14850721 + 1000000000 + 1821923098 = 2836773819
    }
}
