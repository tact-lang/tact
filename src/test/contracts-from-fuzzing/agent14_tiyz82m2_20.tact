struct BoolCombo {
    b1: Bool;
    b2: Bool?;
    b3: Bool;
    b4: Bool?;
}

contract BoolVariations {
    f: BoolCombo;

    init() {
        self.f = BoolCombo{
            b1: true,
            b2: null,
            b3: false,
            b4: true,
        };
    }
}