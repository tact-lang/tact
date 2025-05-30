contract TestUnicode {
    receive() {
        // Testing Unicode escape sequence using \u{...} syntax for the 😂 emoji
        let s: String = "Emoji: \u{1F602}";
        dump(s);
    }
}
