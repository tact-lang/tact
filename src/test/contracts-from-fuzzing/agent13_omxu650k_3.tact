contract Test {
    receive() {
        // Testing newline escape sequence in string literal
        let s: String = "first line\nsecond line";
        dump(s);
    }
}
