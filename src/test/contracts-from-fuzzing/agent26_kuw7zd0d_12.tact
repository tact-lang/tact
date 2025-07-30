contract TestMixEscapes {
    receive() {
        // Testing a mix of multiple escape sequences in one string literal
        let s: String = "Mix escapes: \x20 (hex space), \u{1F600} (grinning face), newline\n, tab\t, and a literal backslash \\";
    }
}
