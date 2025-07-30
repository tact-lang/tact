struct OptionalWithDefaults {
    x: Int? = null;
    y: Bool? = null;
}

contract OptionalDefaults {
    s: OptionalWithDefaults;

    init() {
        self.s = OptionalWithDefaults{};
    }
}