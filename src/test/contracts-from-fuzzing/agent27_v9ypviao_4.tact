contract TestStringLiterals {
    receive() {
        // Simple string literal
        let s1: String = "hello world";
        // String literal with escape sequences
        let s2: String = "Line1\nLine2\tTabbed";
        // String literal with unicode escape
        let s3: String = "Unicode: \u26A1";
    }
}
