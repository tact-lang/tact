contract TestAsciiExact {
    // This test verifies that the ascii() function accepts a string exactly 32 bytes long
    a: Int = ascii("12345678901234567890123456789012");
    
    receive() {
        // No additional runtime logic, just validation at compile time
    }
}
