struct InlineDefaults {
    i: Int = 42;
    b: Bool = true;
    s: String = "abc";
}

contract StructInlineDefaults {
    data: InlineDefaults;

    init() {
        self.data = InlineDefaults{};
    }
}
