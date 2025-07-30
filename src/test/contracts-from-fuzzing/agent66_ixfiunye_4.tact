fun emojiTest(): String {
    return "\u{1F602} is funny \u{1F602}";
}

contract TestContract {
    receive() {
        emojiTest();
    }
}
