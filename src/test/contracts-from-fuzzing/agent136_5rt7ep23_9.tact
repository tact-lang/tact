struct OptionalDefaults {
    a: Int? = null;
    b: Bool? = true;
}

contract OptDef {
    data: OptionalDefaults;

    init() {
        self.data = OptionalDefaults{};
    }
}