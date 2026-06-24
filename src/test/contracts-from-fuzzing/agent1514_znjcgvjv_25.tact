struct OptDef {
    o1: Int? = null;
    o2: Bool? = null;
    o3: String? = null;
}

contract OptionalFieldsWithDefaults {
    s: OptDef;

    init() {
        self.s = OptDef{};
    }
}