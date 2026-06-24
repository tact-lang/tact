contract Test {
    // Test Case 24 – crc32 with non-ASCII string ("тест")
    // Expectation: Should compute crc32 checksum based on UTF-8 encoding of the given string
    t: Int = crc32("тест");
}
