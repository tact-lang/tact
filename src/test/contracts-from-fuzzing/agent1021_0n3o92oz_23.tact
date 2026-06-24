struct OptionalWithDefaults {
    a: Int? = null;
    b: Bool? = null;
    c: String? = null;
}

contract OptDefaults {
    data: OptionalWithDefaults;

    init() {
        self.data = OptionalWithDefaults{};
    }
}