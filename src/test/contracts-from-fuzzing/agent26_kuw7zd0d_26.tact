contract TestMultilineRaw {
    receive() {
        // Testing a raw multiline string literal with an actual newline (not escaped)
        let s: String = "First line
Second line";
    }
}
