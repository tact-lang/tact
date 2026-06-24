struct InlineDefaults {
    x: Int = 42;
    y: Bool = true;
    s: String = "default";
}

contract StructDefaults {
    data: InlineDefaults;

    init() {
        self.data = InlineDefaults{};
    }
}