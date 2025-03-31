contract Test_crc32_empty {
    // Testing crc32() with an empty string. Expected behavior: compute crc32 over empty input.
    checksum: Int = crc32("");

    // Minimal receive function
    receive() {}
}
