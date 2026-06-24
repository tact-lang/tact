struct HasDefaults {
    a: Int = 10;
    b: Bool = true;
}

contract WithStructDefaults {
    s: HasDefaults;
    init() {
        self.s = HasDefaults{};
    }
}