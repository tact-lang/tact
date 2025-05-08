contract Test {
    // Testing crc32() with an empty string
    // Expected: It computes a valid crc32 (maybe 0) or compile error if empty string is not allowed.
    value: Int = crc32("");
    receive() {}
}
