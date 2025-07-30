struct OptionalsWithDefaults {
    x: Int? = null;
    y: String? = null;
    b: Bool? = null;
}

contract DefaultsOptionals {
    val: OptionalsWithDefaults;

    init() {
        self.val = OptionalsWithDefaults{};
    }
}