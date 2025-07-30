contract TestCRC32() {
    // Define a constant evaluated at compile-time using the built-in crc32() function
    // According to documentation, crc32("000DEADBEEF000") should yield 1821923098
    const V: Int = crc32("000DEADBEEF000");

    receive() {
        // Check that the computed constant equals 1821923098
        require(self.V == 1821923098, "crc32 constant evaluation failed");
    }
}
