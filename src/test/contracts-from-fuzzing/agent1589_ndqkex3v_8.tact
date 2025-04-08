struct OptionalDefaults {
    a: Int? = null;
    b: Bool? = null;
    c: String? = null;
}

contract OptDefaults {
    y: OptionalDefaults;

    init() {
        self.y = OptionalDefaults{};
    }
}