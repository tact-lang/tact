struct MixedDefault {
    a: Int = 1;
    b: Bool?;
    c: Int?;
    d: Bool = false;
}

contract DefaultCombo {
    f: MixedDefault;

    init() {
        self.f = MixedDefault{};
    }

    receive() {
        self.f = MixedDefault{
            a: 42,
            b: true,
            c: 55,
            d: true,
        };
    }
}