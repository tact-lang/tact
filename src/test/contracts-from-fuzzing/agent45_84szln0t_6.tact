contract TestCrc32Empty {
    checksum: Int = crc32("");
    
    receive() {}
}
