struct Texts {
    a: String = "Line1\nLine2";
    b: String = "Emoji: \u{1F600}";
}

contract Test {
    texts: Texts;

    init() {
        self.texts = Texts{};
    }
}