contract Test {
    receive() {
        // Test string literal with escape sequences: newline and quote
        let s: String = "Line1\nLine2 \"Quoted\"";
        dump(s.asSlice());
    }
}
