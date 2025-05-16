contract TestCRC32 {
    checksum: Int = crc32("000DEADBEEF000");
    receive () {}
}
