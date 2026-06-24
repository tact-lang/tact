contract SerializedInts {
    ui4: Int as uint4;
    ui6: Int as uint6;
    ui16: Int as uint16;
    i8: Int as int8;
    i64: Int as int64;

    init() {
        self.ui4 = 15;
        self.ui6 = 33;
        self.ui16 = 65535;
        self.i8 = -128;
        self.i64 = -9223372036854775808;
    }
}
