struct SerialCombo {
    a: Int as int64;
    b: Int as int32;
    c: Int as uint8;
    d: Int;
}

contract Test {
    sc: SerialCombo;
    init() {
        self.sc = SerialCombo{ a:1, b:2, c:3, d:4 };
    }
}