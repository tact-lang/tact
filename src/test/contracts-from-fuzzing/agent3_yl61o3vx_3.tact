contract ConstCrc32 {
    // Test compile-time evaluation of crc32 built-in call
    const CRC32_VAL: Int = crc32("000DEADBEEF000");

    receive() {
         // Validate the constant value at runtime using require()
         require(self.CRC32_VAL == 1821923098, "crc32(\"000DEADBEEF000\") did not evaluate to 1821923098");
         cashback(sender());
    }
}
