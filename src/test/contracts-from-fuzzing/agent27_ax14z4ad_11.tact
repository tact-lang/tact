contract TestAsciiMax {
    // Using exactly 32 bytes of ASCII characters
    a: Int = ascii("12345678901234567890123456789012");

    // Dummy receive function
    receive () {}
}
