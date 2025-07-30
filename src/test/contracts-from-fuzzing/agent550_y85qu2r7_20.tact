struct OptionalWithDefaults {
    a: Int?;
    b: Int? = null;
    c: Bool?;
    d: Bool? = null;
}

contract OptDefaults {
    data: OptionalWithDefaults;

    init() {
        self.data = OptionalWithDefaults{};
    }
}