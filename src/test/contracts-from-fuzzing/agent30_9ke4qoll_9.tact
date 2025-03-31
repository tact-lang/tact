contract TestAscii32 {
    // Test ascii() with exactly 32 bytes (32 ASCII characters) which is at the limit.
    // 32 a's as input, which should compile successfully.
    value: Int = ascii("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa");

    receive() {}
}
