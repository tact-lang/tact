struct OptionDefaults {
    foo: Int? = null;
    bar: Bool? = null;
    baz: String? = null;
}

contract DefaultOptionals {
    state: OptionDefaults;

    init() {
        self.state = OptionDefaults{};
    }
}