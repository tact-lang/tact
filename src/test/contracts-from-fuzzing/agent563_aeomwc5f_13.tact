struct DefaultsOpt {
    foo: Int? = null;
    bar: Bool? = null;
}

contract OptDefaults {
    data: DefaultsOpt;

    init() {
        self.data = DefaultsOpt{};
    }
}