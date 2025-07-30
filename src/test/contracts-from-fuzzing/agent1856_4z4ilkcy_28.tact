struct BoolCombo {
    a: Bool; b: Bool?; c: Bool;
    d: Bool?; e: Bool; f: Bool?;
}

contract BoolsStored {
    val: BoolCombo;

    init() {
        self.val = BoolCombo{
            a: true, b: null, c: false,
            d: null, e: true, f: null
        };
    }
}