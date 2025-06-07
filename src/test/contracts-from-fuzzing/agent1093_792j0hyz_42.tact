struct HasDefaults {
    a: Int = 0;
    b: Bool = false;
    c: String = "";
}

contract HasDefaultsWrap {
    x: HasDefaults;

    init() {
        self.x = HasDefaults{};
    }
}