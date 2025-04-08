struct OptionsWithDefaults {
    optional1: Int? = null;
    optional2: String? = null;
    optional3: Bool? = null;
}

contract OptionDefaultsStruct {
    field: OptionsWithDefaults;
    init() {
        self.field = OptionsWithDefaults{};
    }
}
