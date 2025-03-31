contract TestCRC32Empty {
    // Test crc32 with an empty string. The behavior is not explicitly documented; this test checks if it compiles and what the constant is.
    checksum: Int = crc32("");
    receive () {}
}
