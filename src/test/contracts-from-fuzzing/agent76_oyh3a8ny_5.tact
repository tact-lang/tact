contract TestEscapedDoubleQuote {
    receive() {
        // Test string literal with escaped double quotes
        let s: String = "this \"literally\" works";
    }
}
