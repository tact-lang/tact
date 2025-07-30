contract Test {
    receive() {
        // Test hexadecimal escape sequence in a string literal: \x61 should be equivalent to 'a'
        let s: String = "\x61";
    }
}
