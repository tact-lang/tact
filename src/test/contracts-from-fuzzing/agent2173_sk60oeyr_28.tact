struct OptionalsWithDefaults {
    a: Int? = 77;
    b: String? = null;
    c: Bool? = true;
}

contract DefaultsOpt {
    x: OptionalsWithDefaults;

    init() {
        self.x = OptionalsWithDefaults{};
    }
}