struct OptionalsDefaults {
    a: Int? = null;
    b: Bool? = null;
    c: String? = null;
    d: Address? = null;
}

contract TestContract {
    od: OptionalsDefaults;
    init() {
        self.od = OptionalsDefaults{};
    }
}