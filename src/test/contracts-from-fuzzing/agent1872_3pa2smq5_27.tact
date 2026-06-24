struct OptWithDefaults {
    a: Int? = null;
    b: String? = null;
    c: Bool? = null;
}

contract OptionalDefaultsStruct {
    st: OptWithDefaults;

    init() {
        self.st = OptWithDefaults{};
    }
}