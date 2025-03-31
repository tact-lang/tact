contract Test {
    receive() {
        // Testing multi-line string literal without escape characters.
        // Tact strings must be on a single line; this should produce a compile error.
        let s: String = "This is a multi-line
string literal";
    }
}
