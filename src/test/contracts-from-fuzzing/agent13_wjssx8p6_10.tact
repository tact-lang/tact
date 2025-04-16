contract Test {
    // Test crc32() with an empty string. According to docs, it should compute a valid checksum.
    i: Int = crc32("");

    receive () {}
}
