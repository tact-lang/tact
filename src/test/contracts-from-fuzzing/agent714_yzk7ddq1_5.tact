struct DefaultsAndOpts {
    foo: Int = 1;
    bar: Bool?;
    baz: Int? = null;
}

contract TestDefaults {
    s: DefaultsAndOpts;

    init() {
        self.s = DefaultsAndOpts{};
    }
}