contract TestCrc32() {
    // Constant computed at compile-time using crc32 built-in function
    // As per documentation, crc32("000DEADBEEF000") should evaluate to 1821923098
    const CRC: Int = crc32("000DEADBEEF000");

    receive() {
        dump(self.CRC);
    }
}
