contract Test {
    // Testing compile-time function crc32() with an empty string
    // Expecting it to compute the CRC32 checksum of an empty string, likely 0
    c: Int = crc32("");

    receive() {}
}
