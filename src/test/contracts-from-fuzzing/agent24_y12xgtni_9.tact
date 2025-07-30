contract Test {
    // Test compile-time function crc32 with empty string
    // Expected: Should compile and compute crc32 checksum (likely 0 or some constant)
    e: Int = crc32("");

    // Dummy receive function
    receive () {}
}
