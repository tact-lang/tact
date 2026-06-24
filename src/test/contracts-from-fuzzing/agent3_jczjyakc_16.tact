contract TestCrc32Empty {
    // Testing crc32 with an empty string. The expected behavior is to compute the CRC32 of an empty input.
    // Standard CRC32 of an empty string is typically 0x00000000.
    checksum: Int = crc32("");

    receive() {}
}
