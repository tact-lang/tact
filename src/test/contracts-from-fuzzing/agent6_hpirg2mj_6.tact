contract TestAsciiBoundarySuccess {
    // Test ascii() with a 32-byte string literal (boundary condition) which should succeed
    a: Int = ascii("12345678901234567890123456789012"); // exactly 32 characters
    
    receive() {
        return;
    }
}
