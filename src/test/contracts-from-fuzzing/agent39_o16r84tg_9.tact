contract TestCrc32Valid {
    // Testing crc32() with a typical valid input string
    // Expected: embeds the CRC-32 checksum of "000DEADBEEF000" computed at compile-time
    checksum: Int = crc32("000DEADBEEF000");
    
    // Dummy receive function
    receive () {}
}
