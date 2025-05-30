contract Test {
    // Testing compile-time function: crc32 with empty string input
    // According to the docs, crc32("") should compute a valid checksum.
    crc: Int = crc32("");

    receive() {}
}
