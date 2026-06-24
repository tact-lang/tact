contract TestCrc32 {
    // Valid usage of crc32 compile-time function
    checksum: Int = crc32("Hello, CRC!");

    // Dummy receive function
    receive () {}
}
