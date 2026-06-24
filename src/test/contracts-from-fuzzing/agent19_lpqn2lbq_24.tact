struct NestedInlineDefault {
    x: Int = 10;
    y: Bool = false;
}

contract InlineWrap {
    n: NestedInlineDefault;

    init() {
        self.n = NestedInlineDefault{};
    }
}