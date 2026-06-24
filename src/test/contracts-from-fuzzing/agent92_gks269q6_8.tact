contract TestUnicodeLong {
    receive() {
        // Testing Unicode escape using { } variant for emoji character
        // 😀 is U+1F600
        let s: String = "Emoji: \u{1F600}";
        dump(s);
    }
}
