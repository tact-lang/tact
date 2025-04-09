contract Test {
    receive() {
        // Test a normal string literal with common escape sequences
        let s: String = "Line1\nLine2 \"quoted\"";
    }
}
