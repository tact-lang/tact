contract Test {
    receive() {
        // Test valid string literal with hex escape sequence
        // \x41 should represent 'A'
        let s: String = "Hex test: \x41";
    }
}
