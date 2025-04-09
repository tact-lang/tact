contract TestCrc32Valid {
    // Test: Valid usage of crc32() computes a checksum from a string
    // Expected: Compiles with a checksum value computed at compile-time
    checksum: Int = crc32("000DEADBEEF000");

    receive() {}
}
