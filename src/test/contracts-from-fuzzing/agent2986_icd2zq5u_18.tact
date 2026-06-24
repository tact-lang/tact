// using persistent fields with explicit serialization formats
contract ExplicitFormats {
    i8: Int as int8;
    u16: Int as uint16;
    coin: Int as coins;
    flag: Bool;

    init() {
        self.i8 = -50;
        self.u16 = 1000;
        self.coin = ton("0.2");
        self.flag = true;
    }
}