contract Test {
    // Test 18: Testing ascii() with an exactly 32-character ASCII string (borderline allowed length)
    // Expected behavior: This should compile successfully, as ascii() accepts up to 32 bytes.
    val: Int = ascii("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa");
    receive() {}
}
