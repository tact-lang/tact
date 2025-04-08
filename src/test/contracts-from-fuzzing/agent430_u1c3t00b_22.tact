struct InlineOptionalDefaults {
    a: Int? = null;
    b: Bool? = null;
}

contract Test {
    data: InlineOptionalDefaults;

    init() {
        self.data = InlineOptionalDefaults{};
    }
}