contract Test {
    // Test using ascii() with a 32-byte string literal.
    a: Int = ascii("12345678901234567890123456789012");

    receive() {
        // No runtime operations needed
    }
}
