contract TestLiteralString {
    receive() {
        // Simple string literal
        dump("Hello, Tact!");
        // String literal with newline escape sequence
        dump("Line1\nLine2");
        // String literal with escaped quotes
        dump("Quote: \"Text\"");
    }
}
