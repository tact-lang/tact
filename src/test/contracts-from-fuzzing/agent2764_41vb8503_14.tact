contract SerializeInts {
    i8: Int as int8;
    ui8: Int as uint8;
    i16: Int as int16;
    ui16: Int as uint16;
    i32: Int as int32;
    ui32: Int as uint32;
    i64: Int as int64;
    ui64: Int as uint64;
    coin: Int as coins;

    init() {
        self.i8 = 1;
        self.ui8 = 2;
        self.i16 = 3;
        self.ui16 = 4;
        self.i32 = 5;
        self.ui32 = 6;
        self.i64 = 7;
        self.ui64 = 8;
        self.coin = ton("1");
    }
}