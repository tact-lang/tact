struct OptionalWithDefaults {
    a: Int? = null;
    b: Bool? = null;
}

contract OptionalDefaultsStruct {
    s: OptionalWithDefaults;
    init() {
        self.s = OptionalWithDefaults{};
    }
}