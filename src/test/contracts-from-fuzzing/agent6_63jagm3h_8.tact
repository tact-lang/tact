contract Test {
    receive() {
        test();
    }
}

fun test(): String {
    return "Emoji: \u{1F602}";
}