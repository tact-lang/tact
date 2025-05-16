contract Test {
    receive() {
        // Testing hex escape sequence in string literal: \x41 should produce 'A'
        let s: String = "Letter: \x41";
        dump(s);
    }
}
