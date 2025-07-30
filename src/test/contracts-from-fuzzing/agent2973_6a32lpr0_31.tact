struct OptDefaults {
    o1: Int? = null;
    o2: Bool? = null;
    o3: String? = null;
}

contract OptDefaultsContract {
    f: OptDefaults;

    init() {
        self.f = OptDefaults{};
    }
}