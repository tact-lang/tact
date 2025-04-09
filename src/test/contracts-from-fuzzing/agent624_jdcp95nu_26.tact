struct OptDefaults {
    a: Int? = null;
    b: Bool? = null;
    c: String? = null;
}

contract OptDefaultsContract {
    data: OptDefaults;

    init() {
        self.data = OptDefaults{};
    }
}