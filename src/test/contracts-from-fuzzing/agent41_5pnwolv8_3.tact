contract TestEscape {
    receive() {
        // Test string literal with embedded double quotes (escape sequence)
        let s: String = "She said \"Hello, Tact!\"";
    }
}
