contract TestCRC32() {
    // Testing compile-time evaluation of crc32 built-in function
    // Expected value: 1821923098
    const CRC_VALUE: Int = crc32("000DEADBEEF000");

    receive() {
        dump(self.CRC_VALUE);
    }
}
