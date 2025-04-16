struct InlineDefaults {
    a: Int = 3;
    b: Bool = false;
}

contract UsesDefaults {
    data: InlineDefaults;

    init() {
        self.data = InlineDefaults{};
    }
}
