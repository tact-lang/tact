contract Test {
    receive() {
        // Testing string literal with a trailing escape sequence for backslash
        // "Hello\\" should result in the string: Hello\
        let s: String = "Hello\\";
    }
}
