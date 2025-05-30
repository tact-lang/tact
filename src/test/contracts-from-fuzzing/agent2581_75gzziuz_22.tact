struct OptDefault {
    foo: Int? = null;
    bar: Bool? = null;
}

contract NullableDefaults {
    entry: OptDefault;

    init() {
        self.entry = OptDefault{};
    }
}
