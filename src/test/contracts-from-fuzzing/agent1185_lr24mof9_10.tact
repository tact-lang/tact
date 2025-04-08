contract VariousSerializations {
    i_default: Int; 
    i_u8: Int as uint8;
    i_i32: Int as int32;
    i_u64: Int as uint64;
    bflag: Bool;

    init() {
        self.i_default = 123;
        self.i_u8 = 255;
        self.i_i32 = -12345;
        self.i_u64 = 123456789;
        self.bflag = true;
    }
}