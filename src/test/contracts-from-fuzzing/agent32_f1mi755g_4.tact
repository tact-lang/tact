contract TestCRC32() {
    // Test constant evaluation of the crc32 compile-time function
    // Expected: crc32("000DEADBEEF000") produces 1821923098
    const CRC: Int = crc32("000DEADBEEF000");

    receive() {
        dump(self.CRC); // Expected dump: 1821923098
    }
}
