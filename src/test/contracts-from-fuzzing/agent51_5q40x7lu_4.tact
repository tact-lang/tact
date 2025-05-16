contract TestCrc32 {
    // Using the built-in compile-time function crc32() to compute the CRC32 checksum of a string.
    // According to the documentation, crc32("000DEADBEEF000") should evaluate to 1821923098.
    const VALUE: Int = crc32("000DEADBEEF000");

    get fun getValue(): Int {
        return self.VALUE;
    }
}
