contract UIntSerializations {
    ui8: Int as uint8;
    ui16: Int as uint16;
    si64: Int as int64;
    co: Int as coins;

    init() {
        self.ui8 = 255;
        self.ui16 = 65535;
        self.si64 = -1000;
        self.co = ton("1");
    }
}
