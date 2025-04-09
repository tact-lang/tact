struct InlineDefault {
    a: Int = 1;
    b: Bool = false;
    c: Int?;
    d: Bool?;
}

contract Test {
    v: InlineDefault;

    init() {
        self.v = InlineDefault{};
    }
}