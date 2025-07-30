contract Test {
    // Test crc32() with a valid string and an empty string
    valid: Int = crc32("000DEADBEEF000");
    empty: Int = crc32("");

    receive () {}
}
