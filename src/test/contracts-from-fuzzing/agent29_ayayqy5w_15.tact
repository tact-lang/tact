contract Test {
    receive() {
        // Test trailing incomplete escape sequence in a string literal
        // The string ends with a single backslash, which should be rejected because it escapes the closing quote
        let s: String = "Incomplete escape sequence: \\";
    }
}
