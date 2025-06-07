contract Test {
    // Test ascii() with exactly 32 ASCII characters - should compile
    a: Int = ascii("01234567890123456789012345678901"); // 32 characters exactly

    receive () {}
}
