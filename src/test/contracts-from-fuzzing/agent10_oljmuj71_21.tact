contract Test {
    // Testing ascii() with exactly 32 bytes; should be accepted according to docs.
    a: Int = ascii("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa");
    receive() {}
}
