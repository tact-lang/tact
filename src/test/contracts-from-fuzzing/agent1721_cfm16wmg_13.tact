struct OptDefaults {
    a: Int? = null;
    b: Bool? = null;
    c: String? = null;
}

contract OptDef {
    data: OptDefaults;

    init() {
        self.data = OptDefaults{};
    }
}