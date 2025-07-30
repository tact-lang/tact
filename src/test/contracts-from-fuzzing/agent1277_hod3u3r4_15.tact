struct OptionalWithDefaults {
    a: Int? = null;
    b: Bool? = null;
    s: String? = null;
}

contract OptDefaults {
    data: OptionalWithDefaults;

    init() {
        self.data = OptionalWithDefaults {};
    }
}
