contract TestOnlyEscapes {
    receive() {
        // Construct a string literal composed solely of valid escape sequences
        let s: String = "\n\t\r\x21\u0041\u{1F600}"; // newline, tab, carriage return, '!', 'A', 😀
    }
}
