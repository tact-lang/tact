contract TestStringLiteral {
    receive() {
        // Test simple string literal
        dump("Hello, TON!");
        
        // Test string with escape sequences
        dump("Line 1\nLine 2\tTabbed");
        
        // Test string with quotes and backslash
        dump("She said, \"Hello\" and left.");
    }
}
