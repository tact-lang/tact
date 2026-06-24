contract TestAscii {
    // Test compile-time ascii function on valid strings
    // 'a' should be converted to its ASCII value 97
    // '⚡' is encoded into multiple bytes; result is implementation-defined but should be non-zero
    a: Int = ascii("a");
    zap: Int = ascii("⚡");

    receive() {
        // No runtime behavior needed
    }
}
