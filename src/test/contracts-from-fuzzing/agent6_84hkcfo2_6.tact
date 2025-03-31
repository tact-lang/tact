contract Test {
    // Testing crc32() compile-time function with an empty string
    checksum: Int = crc32("");

    receive() {
    }
}
