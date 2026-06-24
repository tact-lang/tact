contract Test {
    // Testing ascii with exactly 32 bytes (expected to succeed)
    a: Int = ascii("01234567890123456789012345678901");

    receive () {}
}
