contract Test {
    receive() {
        // Testing Unicode escapes with flexible \u{...} notation
        let s: String = "Emoji: \u{1F602} and \u{1F602}";
        dump(s);
    }
}
