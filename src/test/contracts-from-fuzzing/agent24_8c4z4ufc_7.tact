contract TestCrc32Empty {
    // Testing crc32 with an empty string at compile-time
    checksum: Int = crc32("");

    receive() {}
}
