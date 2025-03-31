contract TestAsciiBoundary {
    // Testing compile-time function ascii() with a string exactly 32 bytes long
    // "abcdefghijklmnopqrstuvwxyz123456" is 32 characters long
    val: Int = ascii("abcdefghijklmnopqrstuvwxyz123456");
}
