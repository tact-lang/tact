struct InlineDefault {
    a: Int = 1;
    b: String = "B";
}

contract Test {
    s: InlineDefault;
    init() {
        self.s = InlineDefault{};
    }
}