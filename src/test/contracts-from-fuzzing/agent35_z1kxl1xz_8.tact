contract TestCrc32Valid {
    // Testing valid usage of compile-time function crc32
    c: Int = crc32("000DEADBEEF000"); // Expected: 1821923098
}
