contract Test {
    // Test compile-time function: crc32(String) with empty string
    // This should compile and return a checksum constant for an empty string
    checksum: Int = crc32("");
    receive() {}
}
