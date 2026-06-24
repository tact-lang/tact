contract Test {
    // Testing crc32 with an empty string check edge behavior
    checksum: Int = crc32("");

    receive() {}
}
