contract TestEscapedNewline {
    receive() {
        // Test string literal with escaped newline character
        let s: String = "Line1\nLine2";
    }
}
