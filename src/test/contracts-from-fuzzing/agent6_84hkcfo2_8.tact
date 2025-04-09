contract Test {
    // Testing ascii() compile-time function with exactly 32-byte string (edge case: maximum allowed length)
    // '12345678901234567890123456789012' has exactly 32 ASCII characters.
    val: Int = ascii("12345678901234567890123456789012");

    receive() {
    }
}
