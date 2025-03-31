contract TestExactAscii {
    // Test exactly 32 ASCII characters which is the documented limit for ascii()
    a: Int = ascii("12345678901234567890123456789012");
    receive() {}
}
