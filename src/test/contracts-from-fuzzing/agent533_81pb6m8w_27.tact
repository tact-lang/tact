struct OptionalsInDefaults {
    a: Int? = null;
    b: Bool? = null;
    c: String? = null;
    d: Address? = null;
    e: Cell? = null;
}

contract Test {
    d: OptionalsInDefaults;

    init() {
        self.d = OptionalsInDefaults{};
    }
}