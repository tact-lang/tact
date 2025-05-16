contract Test {
    // Test a valid usage of compile-time function crc32 with known input.
    // According to documentation, crc32("000DEADBEEF000") should result in 1821923098.
    // We simply store it in a constant to check if it compile-time evaluates correctly.
    const checksum: Int = crc32("000DEADBEEF000");

    receive() {}
}
