struct OptionsWithDefaults {
    a: Int? = null;
    b: Bool? = null;
    c: String? = null;
}

contract OptsDefaulted {
    d: OptionsWithDefaults;

    init() {
        self.d = OptionsWithDefaults{};
    }
}