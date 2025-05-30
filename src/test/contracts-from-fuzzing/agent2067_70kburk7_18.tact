struct OptDefaults {
    a: Int? = null;
    b: Bool? = null;
    c: String? = null;
}

contract OptionDefaults {
    od: OptDefaults;

    init() {
        self.od = OptDefaults{};
    }
}