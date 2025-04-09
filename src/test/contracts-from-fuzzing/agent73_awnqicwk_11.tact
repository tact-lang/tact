struct NestedDefaults {
    f1: Int = 10;
    f2: Bool? = null;
    f3: String = "default";
}

contract WithDefaults {
    n: NestedDefaults;
    init() {
        self.n = NestedDefaults{};
    }
}