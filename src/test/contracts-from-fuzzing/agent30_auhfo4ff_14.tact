contract TestAsciiUnicodeOverlimit {
    // Each '⚡' is a Unicode code point, counting as 4 bytes for ascii() conversion.
    // Maximum allowed is 8 code points. Here we use 9, expecting a compile-time error.
    a: Int = ascii("⚡⚡⚡⚡⚡⚡⚡⚡⚡");
}
