contract Test {
    receive() {
        // Test using an actual newline inside a string literal without escape:
        // According to Tact specification, string literal should not contain raw newlines.
        let s: String = "Hello,
world!";
    }
}
