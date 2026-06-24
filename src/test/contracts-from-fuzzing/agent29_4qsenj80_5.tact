contract Test {
    // Test ascii() with exactly 32-byte input (borderline case)
    a: Int = ascii("0123456789abcdef0123456789abcdef");
    receive() {}
}
