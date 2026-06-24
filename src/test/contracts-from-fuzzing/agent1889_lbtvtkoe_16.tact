struct SwithOptDefaults {
    a: Int? = null;
    b: Bool? = null;
    c: String? = null;
}

contract OptDefaultsStorage {
    s: SwithOptDefaults;

    init() {
        self.s = SwithOptDefaults{};
    }
}
