struct OptionalsWithDefaults {
    a: Int? = null;
    b: Bool? = null;
    c: Address? = null;
    d: String? = null;
}

contract Test {
    data: OptionalsWithDefaults;

    init() {
        self.data = OptionalsWithDefaults{};
    }
}