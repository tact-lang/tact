struct HasDefault {
    a: Int = 7;
    b: Int?;
}

contract TestDefaults {
    s: HasDefault;

    init() {
        self.s = HasDefault{};
    }

    receive() {
        self.s = HasDefault{a: 42, b: null};
    }
}
