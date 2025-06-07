contract TestCrc32Empty {
    // Testing crc32 with an empty string
    value: Int = crc32("");
    
    receive() {}
}
