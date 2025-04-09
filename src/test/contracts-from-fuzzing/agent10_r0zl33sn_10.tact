fun test_valid_unicode() {
    // Test valid Unicode escape: \u{1F602} should produce the 😂 emoji
    let s: String = "Emoji: \u{1F602}";
    dump(s);
}

contract TestContract {
    receive() {
        test_valid_unicode();
    }
}
