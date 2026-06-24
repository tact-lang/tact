fun test_string() {
    let s: String = "Hello, Tact!";
    let escape: String = "Line1\nLine2\tTabbed\"Quote\"";
    let emoji: String = "Emoji: \u{1F602}";
}

contract Test {
    receive() {
        test_string();
    }
}
