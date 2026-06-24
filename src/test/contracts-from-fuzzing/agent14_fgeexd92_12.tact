contract TestCrc32Valid {
    // Valid CRC32 conversion using a valid string
    checksum: Int = crc32("000DEADBEEF000");
    
    receive () {}
}
