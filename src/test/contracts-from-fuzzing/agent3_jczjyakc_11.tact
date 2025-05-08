contract TestAsciiEmojiEdge {
    // Testing compile-time function ascii with exactly 32 bytes made up of eight 4-byte Unicode characters (emoji).
    // Each '🧡' is represented in UTF-8 by 4 bytes.
    value: Int = ascii("🧡🧡🧡🧡🧡🧡🧡🧡");

    receive() {}
}
