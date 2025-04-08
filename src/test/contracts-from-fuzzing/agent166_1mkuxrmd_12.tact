contract TestContract {
    i8: Int as int8;
    u8: Int as uint8;
    i16: Int as int16;
    u16: Int as uint16;
    coin: Int as coins;

    init() {
        self.i8 = -5;
        self.u8 = 250;
        self.i16 = -32000;
        self.u16 = 65000;
        self.coin = ton("1");
    }
}