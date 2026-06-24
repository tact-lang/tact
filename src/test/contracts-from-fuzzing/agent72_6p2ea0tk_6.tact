fun extended_escapes(): String {
    return "Line1\nLine2 with space\x20 and A: \u0041, emoji: \u{1F600}";
}

contract Test {
    receive() {
        extended_escapes();
    }
}
