struct OptionalsWithDefaults {
    x: Int? = null;
    y: Bool? = null;
}

contract OptionalWithDefaults {
    optDef: OptionalsWithDefaults;
    init() {
        self.optDef = OptionalsWithDefaults{};
    }
}