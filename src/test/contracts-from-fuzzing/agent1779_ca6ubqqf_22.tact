struct OptionalWithDefaults {
    x: Int? = null;
    y: Bool? = null;
}

contract OptionalDefaults {
    state: OptionalWithDefaults;
    init() {
        self.state = OptionalWithDefaults{};
    }
}