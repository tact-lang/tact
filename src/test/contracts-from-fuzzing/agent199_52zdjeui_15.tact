struct StructOptDefaults {
    foo: Int? = null;
    bar: Bool? = null;
    baz: String? = null;
}

contract OptDefaults {
    s: StructOptDefaults;

    init() {
        self.s = StructOptDefaults{};
    }
}