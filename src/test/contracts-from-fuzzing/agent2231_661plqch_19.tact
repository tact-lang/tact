struct OptionalWithDefaults {
    a: Int? = null;
    b: String? = null;
    c: Bool? = null;
}

contract OptionalDefaultsContract {
    foo: OptionalWithDefaults;

    init() {
        self.foo = OptionalWithDefaults{};
    }
}