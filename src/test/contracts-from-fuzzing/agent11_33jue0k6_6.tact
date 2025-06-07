contract Test {
    // Testing compile-time function crc32 with a valid input string.
    // Expected behavior: should compile successfully and embed the computed checksum as an integer constant.
    // Reference: docs indicate crc32("000DEADBEEF000") should yield 1821923098.
    a: Int = crc32("000DEADBEEF000");

    receive() {}
}
