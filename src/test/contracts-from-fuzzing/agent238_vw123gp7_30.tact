struct OptionalsAndDefaults {
    i: Int? = null;
    b: Bool? = null;
}

contract OptDefaults {
    data: OptionalsAndDefaults;

    init() {
        self.data = OptionalsAndDefaults{};
    }
}