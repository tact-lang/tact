struct OptionalDefaults {
    a: Int? = null;
    b: Bool? = null;
    c: String? = null;
    d: Address? = null;
}

contract OptDefAll {
    state: OptionalDefaults;

    init() {
        self.state = OptionalDefaults{};
    }
}
