contract TestStringLiteral {
    receive() {
        // Test string literal expression, including escapes
        let s: String = "Test string literal with escape: \n new line";
        dump(s);
    }
}
