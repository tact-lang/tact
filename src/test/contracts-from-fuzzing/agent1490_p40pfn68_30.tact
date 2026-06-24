struct OptAndDefaults {
    v1: Int? = null;
    v2: String? = null;
}

contract OptDefaults {
    s: OptAndDefaults;

    init() {
        self.s = OptAndDefaults{};
    }
}