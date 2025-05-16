contract TestAsciiUnicode {
    // Test ascii() conversion for a single multi-byte Unicode character (lightning emoji)
    a: Int = ascii("⚡");
    receive() {}
}
