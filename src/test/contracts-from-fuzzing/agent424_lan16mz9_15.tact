struct InlineDefaults {
    a: Int = 1;
    b: Bool = false;
    c: String = "abc";
}

contract StructDefaults {
    data: InlineDefaults;

    init() {
        self.data = InlineDefaults{};
    }
}