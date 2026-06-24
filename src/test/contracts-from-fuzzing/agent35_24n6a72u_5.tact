contract Test {
    // Test using crc32 with an empty string
    // According to the docs, this should compute the CRC-32 checksum of an empty string.
    f: Int = crc32("");

    receive() {}
}
