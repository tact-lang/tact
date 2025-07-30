contract TestCrc32Empty {
    // Test crc32() with an empty string. The behavior is to compute a CRC-32 checksum from an empty string.
    // Expected behavior: Compute CRC-32 of empty string, not to throw an error.
    checksum: Int = crc32("");

    receive() {}
}
