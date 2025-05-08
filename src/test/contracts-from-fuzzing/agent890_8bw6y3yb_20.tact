struct OptionalWithDefaults {
    a: Int? = null;
    b: Bool? = null;
}

contract Test {
    s: OptionalWithDefaults;

    init() {
        self.s = OptionalWithDefaults{};
    }
}