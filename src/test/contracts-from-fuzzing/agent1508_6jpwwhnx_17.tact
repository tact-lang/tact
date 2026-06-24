struct OptionalDefaults {
    i: Int? = null;
    b: Bool? = null;
    s: String? = null;
}

contract TestContract {
    optDef: OptionalDefaults;

    init() {
        self.optDef = OptionalDefaults{};
    }
}