contract TestMultilineString {
    receive() {
        // Test a multiline string literal; unescaped newline in string literal
        // Expecting a syntax error if newlines are not allowed
        let s: String = "Line one
Line two";
    }
}
