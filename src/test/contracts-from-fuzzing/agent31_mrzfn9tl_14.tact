contract Test {
    receive() {
        // Testing string with embedded null byte using \x00 escape sequence
        let s: String = "Hello\x00World";
        dump(s);
    }
}
