struct OptionDefault {
    a: Int? = null;
    b: Bool? = null;
    c: String? = null;
}

contract TestOptDefaults {
    data: OptionDefault;

    init() {
        self.data = OptionDefault{};
    }
}