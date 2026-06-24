struct OptionWithDefaults {
    a: Int? = null;
    b: Bool? = null;
}

contract OptDefaults {
    data: OptionWithDefaults;

    init() {
        self.data = OptionWithDefaults{};
    }
}
