struct Basic {
    a: Int;
}

contract BasicDefaults {
    s: Basic = Basic{ a: 3 };

    init() {
        self.s = Basic{ a: 4 };
    }
}
