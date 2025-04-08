struct OptionalAndDefaults {
    x: Int?;
    y: Bool? = null;
    s: String? = null;
    f: Int = 42;
}

contract OptionDefaultCombo {
    test: OptionalAndDefaults;

    init() {
        self.test = OptionalAndDefaults{ x: null };
    }
}