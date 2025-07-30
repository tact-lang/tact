struct HasOptionalDefaults {
    a: Int? = null;
    b: Bool? = null;
    s: String? = null;
}

contract OptDef {
    v: HasOptionalDefaults;

    init() {
        self.v = HasOptionalDefaults{};
    }
}