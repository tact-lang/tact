struct OptionDefaults {
    a: Int? = null;
    b: String? = null;
    c: Bool? = null;
    d: Address? = null;
}

contract OptionsDefaulted {
    val: OptionDefaults;

    init() {
        self.val = OptionDefaults{};
    }
}