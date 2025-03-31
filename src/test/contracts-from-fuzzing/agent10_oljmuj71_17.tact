contract Test {
    // Testing crc32() with a Unicode character (lightning bolt) to explore how non-ASCII input is handled
    // Expected behavior: It should compute a crc32 checksum of the UTF-8 encoded bytes of "⚡".
    value: Int = crc32("⚡");
    receive() {}
}
