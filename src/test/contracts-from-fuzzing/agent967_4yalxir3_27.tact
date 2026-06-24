struct OptionalsDefaults {
    a: Int? = null;
    b: Bool? = null;
    c: String? = null;
    d: Address? = null;
}

contract OptDefaultsCombined {
    s: OptionalsDefaults;

    init() {
        self.s = OptionalsDefaults{};
    }
}