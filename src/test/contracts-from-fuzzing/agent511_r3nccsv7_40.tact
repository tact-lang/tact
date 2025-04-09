struct OptionalDefaults {
    foo: Int? = null;
    bar: Bool? = null;
    baz: String? = null;
}

contract OptionalsDef {
    val: OptionalDefaults;

    init() {
        self.val = OptionalDefaults{};
    }
}