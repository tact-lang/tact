struct OptionalDefaultsStruct {
    a: Int? = null;
    b: Bool? = null;
    c: String? = null;
}

contract StructDefaults {
    s: OptionalDefaultsStruct;

    init() {
        self.s = OptionalDefaultsStruct{};
    }
}