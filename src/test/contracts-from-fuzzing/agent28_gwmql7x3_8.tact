contract TestCRC32 {
    // Valid usage of crc32 compile-time function
    out: Int = crc32("000DEADBEEF000");

    receive () {}
}
