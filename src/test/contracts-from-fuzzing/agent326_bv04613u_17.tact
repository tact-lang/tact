struct OptionWithDefaults {
    a: Int? = null;
    b: String? = null;
}

contract OptWithDef {
    val: OptionWithDefaults;

    init() {
        self.val = OptionWithDefaults{};
    }
}
