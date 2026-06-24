contract SerialFormats {
    i8: Int as int8; 
    u8: Int as uint8;
    i16: Int as int16;
    u16: Int as uint16;
    i32: Int as int32;
    u32: Int as uint32;
    coin: Int as coins;

    init() {
        self.i8 = 5;
        self.u8 = 6;
        self.i16 = 7;
        self.u16 = 8;
        self.i32 = 9;
        self.u32 = 10;
        self.coin = 11;
    }
}