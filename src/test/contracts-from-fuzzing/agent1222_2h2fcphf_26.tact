struct OptionalDefaults {
    a: Int? = null;
    b: Bool? = null;
    c: String? = null;
}

contract TestOptDefaults {
    s: OptionalDefaults;
    init() {
        self.s = OptionalDefaults{};
    }
}