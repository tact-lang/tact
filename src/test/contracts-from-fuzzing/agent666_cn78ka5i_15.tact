struct OptionalDefaults {
    a: Int? = null;
    b: String? = null;
    c: Bool? = false;
}

contract OptDefCt {
    optdef: OptionalDefaults;

    init() {
        self.optdef = OptionalDefaults{};
    }
}
