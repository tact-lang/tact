contract TestStringLiteral {
    receive() {
        // Test various escape sequences in string literals
        let s: String = "Line1\nLine2\tTabbed\rCarriage\bBackspace\fFormFeed";
    }
}
