struct AllDefaults {
    a: Int = 1; b: Bool = true; c: String = "x";
}

contract DefaultsEverywhere {
    d: AllDefaults;

    init() {
        self.d = AllDefaults{};
    }
}