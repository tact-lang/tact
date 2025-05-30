contract PrimitiveIntWidths {
    i8: Int as int8;
    u16: Int as uint16;
    i32: Int as int32;
    u64: Int as uint64;

    init() {
        self.i8 = 5;
        self.u16 = 300;
        self.i32 = -1000;
        self.u64 = 1234567890;
    }
}