struct OptDef {
    a: Int? = null;
    b: Bool? = null;
    c: String? = null;
}

contract OptDefaults {
    val: OptDef;

    init() {
        self.val = OptDef{};
    }
}