struct WithStringDefaults {
    s1: String = "text";
    s2: String = "another";
}

contract WithStringDefaultsStore {
    s: WithStringDefaults;

    init() {
        self.s = WithStringDefaults{};
    }
}