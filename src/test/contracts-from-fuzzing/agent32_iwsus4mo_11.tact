contract TestCrc32Valid {
    // Testing compile-time function 'crc32' with valid input
    checksum: Int = crc32("000DEADBEEF000");

    receive () {}
}
