contract TestMultiLine {
    receive() {
        // Testing a multi-line string literal using an actual newline within double quotes
        // This is expected to fail if Tact doesn't support multiline strings
        let s: String = "line1
line2";
    }
}
