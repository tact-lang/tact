struct OptionsAndDefaults {
    a: Int? = null;
    b: Bool? = null;
    c: String = "default";
}

contract OptDefFields {
    data: OptionsAndDefaults;
    init() {
        self.data = OptionsAndDefaults{};
    }
}