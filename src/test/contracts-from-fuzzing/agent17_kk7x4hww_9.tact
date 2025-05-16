contract TestAsciiValid {
    // Testing ascii() with a 32-character (32-byte) string, on the edge of allowed length
    value: Int = ascii("12345678901234567890123456789012");

    receive() {}
}
