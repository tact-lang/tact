contract IntSerialization {
    int8: Int as int8;
    int16: Int as int16;
    int64: Int as int64;
    uint4: Int as uint4;
    uint64: Int as uint64;
    int257: Int as int257;

    init() {
        self.int8 = 127;
        self.int16 = 32000;
        self.int64 = 1234567890;
        self.uint4 = 15;
        self.uint64 = 123456789;
        self.int257 = 123456789012345678901234567890;
    }
}