struct SerialCombo {
    a: Int as coins;
    b: Int as uint32;
    c: Int as int64;
    d: Int;
    e: Int as uint1;
}

contract SerialComboContract {
    data: SerialCombo;
    init() {
        self.data = SerialCombo{ a: 1, b: 2, c: 3, d: 4, e: 1 };
    }
}