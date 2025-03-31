fun validEscapeSequence(): String {
    return "Emoji: \u{1F600} and hex: \x41";
}

contract Test {
    receive() {
        validEscapeSequence();
    }
}
