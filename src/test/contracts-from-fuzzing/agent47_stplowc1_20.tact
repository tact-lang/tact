contract TestAsciiBoundary {
    // Test ascii with a string that is exactly 32 bytes long (each ASCII character is 1 byte).
    a: Int = ascii("12345678901234567890123456789012");

    receive() {
        self.a;
    }
}
