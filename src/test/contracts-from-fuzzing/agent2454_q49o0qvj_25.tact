struct BoolIntCombo {
    a: Bool;
    b: Int;
    c: Bool;
    d: Int;
    e: Bool;
}

contract ComboTest {
    combo: BoolIntCombo;

    init() {
        self.combo = BoolIntCombo{
            a: true,
            b: 1,
            c: false,
            d: 2,
            e: true,
        };
    }
}