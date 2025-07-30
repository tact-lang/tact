struct OptionalsWithDefaults {
    a: Int? = null;
    b: String? = null;
    c: Bool? = null;
}

contract TestContract {
    d: OptionalsWithDefaults;

    init() {
        self.d = OptionalsWithDefaults{};
    }
}
