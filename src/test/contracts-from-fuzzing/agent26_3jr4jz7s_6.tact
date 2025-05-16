contract TestCrc32Empty {
    // Test crc32 with empty string
    value: Int = crc32("");
    
    receive() {}
}
