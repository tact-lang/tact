contract Test {
    // Testing compile-time function 'crc32' with an empty string to check edge behavior.
    // According to the documentation, crc32 should compute a checksum, even if the input is empty.
    // Expected to compile successfully, computing the CRC-32 of an empty string.
    value: Int = crc32("");
    
    receive() {}
}
