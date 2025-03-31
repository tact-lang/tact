contract Test {
    // Testing compile-time function crc32 with a valid string input
    // Expected: should embed the crc32 checksum of "000DEADBEEF000", which is 1821923098 as per the docs
    checksum: Int = crc32("000DEADBEEF000");

    receive() {}
}
