contract TestCrc32Valid {
    // Valid use: crc32 of an empty string. Should compile and produce a constant checksum
    c: Int = crc32("");

    // Dummy receiver to force full compilation
    receive() {}
}
