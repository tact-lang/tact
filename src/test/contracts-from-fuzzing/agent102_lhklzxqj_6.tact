contract TestContract {
    receive() {
        // Testing valid Unicode escape sequence with \u{1F602} for 😂 emoji
        let s: String = "Emoji: \u{1F602}";
        dump(s);
    }
}
