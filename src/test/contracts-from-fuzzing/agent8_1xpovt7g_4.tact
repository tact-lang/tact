contract TestCrc32() {
    // Test constant evaluation for the compile-time function crc32
    // Expected value: 1821923098
    const CRC: Int = crc32("000DEADBEEF000");

    receive() {
        // Verify via contract-level constant
        require(self.CRC == 1821923098, "crc32 constant mismatch");
        cashback(sender());
    }
}
