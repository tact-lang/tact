struct SerCombo {
    i1: Int as uint8;
    i2: Int as uint32;
    i3: Int as int64;
    fl: Bool;
    txt: String;
}

contract SerialFormats {
    s: SerCombo;

    init() {
        self.s = SerCombo{
            i1: 255,
            i2: 100000,
            i3: -12345678,
            fl: true,
            txt: "hi"
        };
    }
}