contract TestHexEscape {
    receive() {
        // Test string literal with valid hex escape sequence: \x41 should represent 'A'
        let s: String = "Hello, \x41!";
    }
}
