contract Test {
    // Fuzz Test F1: Use crc32() with an empty string
    checksum: Int = crc32("");

    receive() {}
}
