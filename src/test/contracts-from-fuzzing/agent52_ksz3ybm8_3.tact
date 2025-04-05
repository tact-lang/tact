contract Test {
    // Compile-time constants using built-in functions
    // ascii("⚡") is expected to be 14850721
    // crc32("000DEADBEEF000") is expected to be 1821923098
    // ton("1") is expected to be 1000000000
    const A: Int = ascii("⚡");
    const B: Int = crc32("000DEADBEEF000");
    const C: Int = ton("1");

    // A testing function to validate the constants at runtime
    fun test() {
         // Using require to check that compile-time evaluated constants match expected results.
         require(self.A == 14850721, "ascii(\"⚡\") mismatch");
         require(self.B == 1821923098, "crc32(\"000DEADBEEF000\") mismatch");
         require(self.C == 1000000000, "ton(\"1\") mismatch");
    }

    // Ensure that the function is actually compiled and executed
    receive() {
         self.test();
         cashback(sender());
    }
}
