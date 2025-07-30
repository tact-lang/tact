contract Test {
    // Testing compile-time function 'ascii' with exactly 32 bytes string.
    // According to the documentation, ascii() works only for strings up to 32 bytes.
    // This string is exactly 32 characters long.
    value: Int = ascii("12345678901234567890123456789012");
    
    receive() {}
}
