struct OptionalsWithDefaults {
    x: Int? = null;
    y: Bool? = null;
    z: String? = null;
}

contract OptDefaults {
    foo: OptionalsWithDefaults;
    init() {
        self.foo = OptionalsWithDefaults{};
    }
}