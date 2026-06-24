contract Test {
    // Test 29: Specific text receiver with an escape sequence (newline) in the text literal
    // This tests if the compiler correctly handles escape sequences in receiver literals
    receive("hello\nworld") {
        // Receiver with a newline in its text literal
    }

    receive() {
        // Empty receiver as fallback
    }
}
