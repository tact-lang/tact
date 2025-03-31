contract Test {
    // Valid crc32: expecting the checksum computed at compile-time.
    checksum: Int = crc32("Test string for crc32");
}
