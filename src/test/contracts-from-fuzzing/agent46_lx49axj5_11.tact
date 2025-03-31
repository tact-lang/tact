contract TestUnescapedNewline {
    receive() {
        // This string literal contains an unescaped newline and should trigger a compile error.
        let s: String = "Hello
world";
        s;
    }
}
