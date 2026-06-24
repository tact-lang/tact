contract TestAsciiBoundary {
    // Testing compile-time function ascii with exactly 32 ASCII characters (32 bytes).
    // According to the docs, up to 32 bytes are allowed.
    value: Int = ascii("12345678901234567890123456789012");

    receive() {}
}
