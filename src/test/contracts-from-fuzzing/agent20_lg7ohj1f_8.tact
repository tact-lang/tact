contract TestCrc32Valid {
    // Test crc32: Valid usage with a known string
    // Expected result (based on documentation): 1821923098 for "000DEADBEEF000"
    checksum: Int = crc32("000DEADBEEF000");
    
    receive () {}
}
