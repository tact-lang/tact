contract TestCrc32Valid {
    checksum: Int = crc32("000DEADBEEF000");
    
    receive () {}
}
