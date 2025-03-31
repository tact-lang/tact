contract Test {
    // Test crc32 compile-time function with a valid input
    checksum: Int = crc32("000DEADBEEF000"); // Expected: 1821923098

    receive () {}
}
