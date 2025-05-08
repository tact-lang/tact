contract AnnotatedSizes {
    u4: Int as uint4;
    i8: Int as int8;
    u16: Int as uint16;
    i32: Int as int32;
    u64: Int as uint64;

    init() {
        self.u4 = 5;
        self.i8 = -8;
        self.u16 = 500;
        self.i32 = -123456;
        self.u64 = 123456789;
    }
}