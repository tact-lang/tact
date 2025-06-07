struct Combo {
    a: Int?;
    b: Int as uint16;
    c: String = "hi";
    d: Bool?;
    e: Int as int64;
    f: Bool = false;
}

contract MixedCombo {
    stored: Combo;

    init() {
        self.stored = Combo{
            a: null,
            b: 42,
            d: null,
            e: -100,
        };
    }
}