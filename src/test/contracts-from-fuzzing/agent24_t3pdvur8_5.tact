contract Test {
    receive() {
         // Testing valid long Unicode escape
         let s: String = "Emoji: \u{1F602}";
         dump(s);
    }
}
