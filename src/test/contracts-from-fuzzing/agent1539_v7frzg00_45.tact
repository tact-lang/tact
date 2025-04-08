struct OptionWithDefaults {
    a: Int? = null;
    b: Bool? = null;
}

contract HasDefaultOptionals {
    x: OptionWithDefaults;
    init() {
        self.x = OptionWithDefaults{};
    }
}