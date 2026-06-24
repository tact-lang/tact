contract TestStringLiterals {
    receive() {
        // Simple string literal
        let s1: String = "Hello, Tact!";
        // String with escaped newline
        let s2: String = "Line1\nLine2";
        // String with hexadecimal escape (\x41 is 'A')
        let s3: String = "Hex escape: \x41";
    }
}
