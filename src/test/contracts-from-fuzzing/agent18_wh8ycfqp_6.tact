contract Test {
    // Testing compile-time function crc32 with an empty string
    // Expected: The compiler should compute the CRC32 of an empty string, likely 0 or a defined constant.
    c: Int = crc32("");

    receive() {}
}
