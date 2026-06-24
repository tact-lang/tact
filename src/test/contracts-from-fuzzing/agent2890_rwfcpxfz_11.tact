contract VariousInts {
    u1: Int as uint1;
    u16: Int as uint16;
    u64: Int as uint64;
    i8: Int as int8;
    i32: Int as int32;
    i257: Int as int257;
    
    init() {
        self.u1 = 1;
        self.u16 = 16;
        self.u64 = 64;
        self.i8 = -8;
        self.i32 = -32;
        self.i257 = -257;
    }
}