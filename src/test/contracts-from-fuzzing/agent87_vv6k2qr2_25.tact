struct OptionalWithDefaults {
    a: Int? = null;
    b: Int? = 1;
    c: Bool? = true;
    d: Bool? = null;
}

contract OptionalWithDefaultsContract {
    x: OptionalWithDefaults;

    init() {
        self.x = OptionalWithDefaults{};
    }
}
