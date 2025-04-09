contract Serializations {
    u1: Int as uint1;
    u8: Int as uint8;
    s64: Int as int64;
    s257: Int as int257;

    init() {
        self.u1 = 1;
        self.u8 = 255;
        self.s64 = -9223372036854775808;
        self.s257 = 0;
    }
}