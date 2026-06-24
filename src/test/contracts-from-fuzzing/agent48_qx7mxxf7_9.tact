struct InlineDefaults {
    a: Int = 42;
    b: Bool = true;
    c: String = "test";
}

contract DefaultUse {
    item: InlineDefaults;

    init() {
        self.item = InlineDefaults{};
    }
}
