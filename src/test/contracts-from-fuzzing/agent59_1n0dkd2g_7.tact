contract TestUnicodeEscape {
    receive() {
        // Testing valid Unicode escape sequence using \u{...}
        let s: String = "Emoji: \u{1F602} is funny";
    }
}
