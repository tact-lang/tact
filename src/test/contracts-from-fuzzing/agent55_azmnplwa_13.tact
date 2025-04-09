contract Test {
    // Testing crc32 compile-time string processing
    checksum: Int = crc32("000DEADBEEF000");
    
    receive() {
        // No runtime logic
    }
}
