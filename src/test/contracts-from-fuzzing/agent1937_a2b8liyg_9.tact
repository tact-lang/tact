struct OptionsWithDefaults {
    flag: Bool? = null;
    number: Int? = null;
    message: String? = null;
}

contract OptionalDefaults {
    opts: OptionsWithDefaults;

    init() {
        self.opts = OptionsWithDefaults{};
    }
}
