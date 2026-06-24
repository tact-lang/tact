fun test_unicode() : String {
    return "Emoji: \u{1F600}";
}

contract TestContract {
    receive() {
        test_unicode();
    }
}
