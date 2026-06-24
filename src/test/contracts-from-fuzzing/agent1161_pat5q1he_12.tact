struct OptionalsWithDefaults {
    a: Int? = null;
    b: String? = null;
}

contract OptionalDefault {
    data: OptionalsWithDefaults;

    init() {
        self.data = OptionalsWithDefaults{};
    }
}