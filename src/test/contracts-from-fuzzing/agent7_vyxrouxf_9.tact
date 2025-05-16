contract TestCrcEmpty {
    checksum: Int = crc32("");

    receive() {}
}
