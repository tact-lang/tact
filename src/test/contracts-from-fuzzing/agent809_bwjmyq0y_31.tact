struct OptionWithDefaults {
    x: Int? = null;
    y: Bool? = null;
    z: String? = null;
}

contract OptDefNested {
    data: OptionWithDefaults;

    init() {
        self.data = OptionWithDefaults{ x: null, y: null, z: null };
    }
}