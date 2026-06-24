contract Test {
    // Testing compile-time function: ascii with valid string of exactly 32 bytes
    a: Int = ascii("AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA");

    receive () {}
}
