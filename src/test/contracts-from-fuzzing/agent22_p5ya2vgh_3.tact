struct OptDefaults {
    a: Int? = null;
    b: Bool? = null;
    c: String? = null;
}

contract OptDefaultsContract {
    s: OptDefaults;

    init() {
        self.s = OptDefaults{};
    }
}
