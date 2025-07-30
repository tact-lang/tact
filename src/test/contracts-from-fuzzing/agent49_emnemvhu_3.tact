contract TestAsciiValid {
    // Test ascii with exactly 32 ASCII characters
    a: Int = ascii("12345678901234567890123456789012");
    
    receive() {}
}
