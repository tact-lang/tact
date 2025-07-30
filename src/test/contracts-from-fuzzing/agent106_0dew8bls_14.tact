contract SerialFormats {
    u4: Int as uint4;
    s4: Int as int4;
    u64: Int as uint64;
    s64: Int as int64;

    init() {
        self.u4 = 3;
        self.s4 = -2;
        self.u64 = 1000000;
        self.s64 = -1000000;
    }

    receive() {
        self.u4 +=1;
    }
}