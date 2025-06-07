contract TestCrc32 {
    // Test: using an empty string for CRC-32 checksum input
    // According to documentation, crc32 computes a checksum over the input string.
    // We want to see if empty string is handled gracefully.
    checksum: Int = crc32("");
    
    receive() {}
}
