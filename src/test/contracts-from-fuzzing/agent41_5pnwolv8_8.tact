contract TestEscapesUnicode {
    receive() {
        // Test string literal with various escape sequences including unicode escapes
        let s: String = "Line1\nLine2\twith tab, and emoji: \u{1F602}";
    }
}
