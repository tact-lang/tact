contract Test {
    // Test crc32() with a string containing a non-ASCII unicode character.
    // The character 'ß' is U+00DF, which in UTF-8 is 0xC3 0x9F. This test ensures that crc32 handles Unicode correctly.
    f: Int = crc32("ß");

    receive() {}
}
