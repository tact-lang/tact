contract TestCrc32Empty {
    // Testing crc32 with empty string; expecting 0 or a specific CRC32 value for empty data
    a: Int = crc32("");
    receive() {}
}
