struct OptionalDefaults {
    a: Int? = null;
    b: Bool? = null;
    c: String? = null;
}

contract OptDef {
    foo: OptionalDefaults;

    init() {
        self.foo = OptionalDefaults{};
    }
}
