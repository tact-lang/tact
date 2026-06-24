struct OptionalFieldDefault {
    foo: Int? = null;
    bar: Bool? = null;
    baz: String? = null;
}

contract OptDefaults {
    s: OptionalFieldDefault;
    init() {
        self.s = OptionalFieldDefault{};
    }
}