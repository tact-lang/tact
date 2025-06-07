contract TestConstants {
    // Test constant evaluation for built-in compile-time functions
    // Expected: ton("1") should evaluate to 1000000000 (1 Toncoin = 10^9 nanoToncoins)
    // Expected: ascii("⚡") should evaluate to 14850721
    // Expected: crc32("000DEADBEEF000") should evaluate to 1821923098
    const TON_ONE: Int = ton("1");
    const LIGHTNING: Int = ascii("⚡");
    const CRC_TEST: Int = crc32("000DEADBEEF000");

    fun getTon(): Int {
         return self.TON_ONE;
    }
    
    fun getLightning(): Int {
         return self.LIGHTNING;
    }

    fun getCrc(): Int {
         return self.CRC_TEST;
    }

    receive() {
         dump(self.getTon());
         dump(self.getLightning());
         dump(self.getCrc());
    }
}
