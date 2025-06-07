contract Test {
    // Testing compile-time function ascii() with exactly 32 bytes input (valid edge case)
    // 32 ASCII characters (each is 1 byte)
    a: Int = ascii("abcdefghijklmnopqrstuvwxyz012345");

    receive() {}
}
