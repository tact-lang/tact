struct DefaultsWithOpts {
    a: Int = 5;
    b: Bool? = null;
    c: String? = null;
}

contract WithDefaults {
    v: DefaultsWithOpts = DefaultsWithOpts{};

    init() {
        self.v = self.v;
    }

    receive() {
        self.v = self.v;
    }
}