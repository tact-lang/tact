contract MultipleSerializations {
    i64: Int as int64;
    u4: Int as uint4;
    u32: Int as uint32;
    def: Int;

    init() {
        self.i64 = 5;
        self.u4 = 6;
        self.u32 = 7;
        self.def = 8;
    }
}