contract Test {
    // Test ascii() with a string of exactly 32 bytes (maximum allowed)
    a: Int = ascii("AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"); // 32 A's

    receive() {}
}
