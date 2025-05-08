contract TestAscii32 {
    // Test ascii with exactly 32 characters (edge case, valid)
    a: Int = ascii("12345678901234567890123456789012"); // 32 characters
    
    receive() {}
}
