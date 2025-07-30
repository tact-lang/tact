contract Test {
    // Testing ascii() function with a string exceeding 32 bytes
    // Using an ASCII string of 33 characters (each 1 byte) which should exceed the 32-byte limit
    a: Int = ascii("01234567890123456789012345678901");
    receive() {}
}
