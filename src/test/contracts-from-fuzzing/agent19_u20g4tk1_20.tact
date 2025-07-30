contract TestEmojiCorrect {
    receive() {
        // Test a Unicode escape for an emoji (GRINNING FACE U+1F600) using correct require syntax
        let s: String = "Emoji: \u{1F600}";
        let s2: String = s.asSlice().asString();
        require(s == s2, "emoji mismatch");
    }
}
