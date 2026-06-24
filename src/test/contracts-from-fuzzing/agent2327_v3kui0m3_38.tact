struct EmptyStringDefaults {
    s1: String = "";
    s2: String = "";
}

contract EmptyStrDefaults {
    s: EmptyStringDefaults;

    init() {
        self.s = EmptyStringDefaults{};
    }
}
