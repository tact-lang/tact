contract ExtremeInts {
    i1: Int as int1;   // 1 bit
    i5: Int as int5;   // 5 bits
    i64: Int as int64; // 64 bits
    i256: Int as int256; // 256 bits

    init() {
        self.i1 = 0;
        self.i5 = 5;
        self.i64 = 64;
        self.i256 = 256;
    }
}