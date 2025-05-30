struct InlineDefaultNest {
    x: Int = 5;
    y: String = "abc";
}

contract InlineDefaultTest {
    nd: InlineDefaultNest = InlineDefaultNest{};

    init() {
        self.nd = InlineDefaultNest{x: 7, y: "def"};
    }
}