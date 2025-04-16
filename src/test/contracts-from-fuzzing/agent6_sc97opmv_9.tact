contract TestCRC32Valid {
    ret: Int = crc32("000DEADBEEF000"); // Expected to compile and embed checksum as per documentation
    
    // dummy receive to make contract valid
    receive () {}
}
