struct OptionWithDefaults {
    a: Int? = null;
    b: Bool? = true;
    c: String? = null;
}

contract OptionalDefaultsStruct {
    s: OptionWithDefaults;

    init() {
        self.s = OptionWithDefaults{};
    }
}