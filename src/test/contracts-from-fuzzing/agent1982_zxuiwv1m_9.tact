struct OptIntDefault {
    a: Int? = null;
    b: Int? = null;
    c: Int? = null;
}

contract OptDefaults {
    optf: OptIntDefault;

    init() {
        self.optf = OptIntDefault{};
    }
}