contract TestCrc32Empty {
    // Testing crc32() with an empty string
    checksum: Int = crc32("");
    
    receive() {}
}
