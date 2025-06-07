struct HasOptionalDefaults {
    a: Int? = null;
    b: Bool? = null;
    c: String? = null;
}

contract Test {
    foo: HasOptionalDefaults;
    init() {
        self.foo = HasOptionalDefaults{};
    }
}