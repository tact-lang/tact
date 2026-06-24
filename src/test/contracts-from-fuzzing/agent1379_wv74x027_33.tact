struct OptDef {
    a: Int? = null;
    b: Bool? = null;
}

contract OptWithDefaults {
    s: OptDef;

    init() {
        self.s = OptDef{};
    }
}
