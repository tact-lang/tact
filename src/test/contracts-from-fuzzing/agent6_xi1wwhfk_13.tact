contract TestCompileTime() {
    // Contract-level constants computed at compile-time using compile-time functions
    const A: Int = ascii("⚡");            // Expected to compute the integer value for emoji ⚡
    const TON_1: Int = ton("1");            // Expected: 1000000000 (1e9)
    const CRC_TEST: Int = crc32("test");      // Expected: compile-time evaluated crc32 of "test"
    const SHA256_ABC: Int = sha256("abc");    // Expected: compile-time evaluated SHA256 of "abc"

    fun test() {
        // Dumping compile-time evaluated constants to verify their values by referencing them via 'self'
        dump(self.A);
        dump(self.TON_1);
        dump(self.CRC_TEST);
        dump(self.SHA256_ABC);
    }

    receive() {
        self.test();
        cashback(sender());
    }
}
