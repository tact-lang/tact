contract TestCrc32Empty {
    // Test crc32 with an empty string. According to documentation, crc32 should compute a checksum even for an empty input.
    cs: Int = crc32("");

    receive() {}
}
