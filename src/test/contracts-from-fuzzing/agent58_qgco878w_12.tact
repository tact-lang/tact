struct OptionalDefaults {
    a: Int? = null;
    b: Int? = 1;
    c: Bool? = true;
    d: Bool? = null;
}

contract OptDefaultVals {
    data: OptionalDefaults;

    init() {
        self.data = OptionalDefaults{};
    }
}