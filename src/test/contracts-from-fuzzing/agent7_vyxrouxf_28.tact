contract TestAsciiNonAscii {
    // Testing ascii() with a non-ASCII character (é), which is two bytes in UTF-8: 0xC3 0xA9
    // Expected behavior: the output should be the concatenation of the two bytes: 0xC3A9 (50025 in decimal)
    value: Int = ascii("é");

    receive() {}
}
