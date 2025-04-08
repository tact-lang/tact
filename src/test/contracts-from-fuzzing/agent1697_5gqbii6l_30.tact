struct OptionalsWithDefaults {
    a: Int? = null;
    b: Bool? = null;
    c: Address? = null;
    d: String? = null;
    e: Cell? = null;
}

contract TestContract {
    f: OptionalsWithDefaults;

    init() {
        self.f = OptionalsWithDefaults{};
    }
}