/// Test case: Valid usage of compile-time function crc32
contract TestCrc32Valid {
    // Compute the CRC-32 checksum of a given string. Expected to embed a valid Int.
    checksum: Int = crc32("000DEADBEEF000");

    receive () {}
}
