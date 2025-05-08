struct MixedDefaults {
    a: Int = 42;
    b: Int? = null;
    c: Bool = true;
    d: Bool? = null;
    e: String = "hi";
    f: String? = null;
}

contract MixedDefaultsHolder {
    data: MixedDefaults = MixedDefaults{};

    init() {
        self.data = MixedDefaults{};
    }
}
