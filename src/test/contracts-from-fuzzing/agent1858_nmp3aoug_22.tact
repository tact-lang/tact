struct OptionalWithDefaults {
    a: Int? = null;
    b: String? = null;
    c: Bool? = null;
}

contract OptDefContract {
    x: OptionalWithDefaults;
    init() {
        self.x = OptionalWithDefaults{};
    }
}