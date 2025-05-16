struct OptionalWithDefaults {
    a: Int? = null;
    b: Bool? = true;
    c: String? = null;
}

contract DefaultedOpts {
    test: OptionalWithDefaults;

    init() {
        self.test = OptionalWithDefaults{};
    }
}