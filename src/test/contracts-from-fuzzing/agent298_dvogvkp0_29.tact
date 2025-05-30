struct InlineDefault {
    a: Int = 10;
    b: Bool = true;
    c: String = "foo";
}

contract DefaultsInline {
    d: InlineDefault;
    init() {
        self.d = InlineDefault{};
    }
}