struct HasDefaults {
    a: Int = 10;
    b: Bool = false;
    c: String = "hi";
}

contract WithDefaults {
    s: HasDefaults;

    init() {
        self.s = HasDefaults{};
    }
}