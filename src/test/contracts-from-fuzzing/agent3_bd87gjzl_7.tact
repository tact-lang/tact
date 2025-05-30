contract Test {
    // Test crc32() with an empty string. According to documentation, this should compute a valid checksum at compile-time.
    x: Int = crc32("");

    receive () {}
}
