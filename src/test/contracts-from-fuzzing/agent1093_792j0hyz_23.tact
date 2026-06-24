struct OptionalDefaults {
    x: Int? = null;
    y: Bool? = null;
    z: String? = null;
}

contract OptionalDefaultsContract {
    s: OptionalDefaults;

    init() {
        self.s = OptionalDefaults{};
    }
}