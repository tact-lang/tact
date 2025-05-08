struct OptionalAndDefaults {
    foo: Int = 3;
    bar: String?;
    baz: Bool = false;
}

contract ComboOptDef {
    data: OptionalAndDefaults;

    init() {
        self.data = OptionalAndDefaults{};
    }
}
