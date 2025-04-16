contract TestCRC32 {
    // Testing crc32 with an empty string. The docs do not specify error for empty input, so it should compute a checksum.
    checksum: Int = crc32("");
    
    receive() {}
}
