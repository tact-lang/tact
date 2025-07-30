contract Test {
    // Test 18: Use ascii() on a string exactly 32 bytes long (32 characters, each 1 byte)
    // This should compile and produce a valid constant.
    a: Int = ascii("abcdefghijklmnopabcdefghijklmnop");
    receive() {}
}
