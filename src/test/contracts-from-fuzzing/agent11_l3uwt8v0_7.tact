contract TestAsciiBoundary {
    // Exactly 32 characters -- within the 32-byte limit for ascii()
    a: Int = ascii("12345678901234567890123456789012");
    receive() {}
}
