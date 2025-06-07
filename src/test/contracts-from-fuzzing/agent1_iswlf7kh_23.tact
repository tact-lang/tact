contract TestExactAscii {
    // Test ascii() with a string occupying exactly 32 bytes
    a: Int = ascii("12345678901234567890123456789012");

    receive() {
    }
}
