contract Test {
    // Valid ascii compile-time function test: exactly 32 bytes string
    a: Int = ascii("abcdefghijklmnopqrstuvwxyz012345");

    // Dummy receive function
    receive () {}
}
