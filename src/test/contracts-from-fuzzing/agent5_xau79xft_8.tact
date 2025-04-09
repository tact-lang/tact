contract TestCRC32Empty {
    // Testing crc32("") with an empty string.
    // Expected to compute a checksum (an Int) at compile time.
    x: Int = crc32("");
    
    receive () {}
}
