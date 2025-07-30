contract TestContract {
    int1: Int as uint4;   // 0-15
    int2: Int as int64;  // 64-bit signed
    int3: Int as int257; // default int
    int4: Int as uint256; // large unsigned
    int5: Int as int8;    // small signed

    init() {
        self.int1 = 10;
        self.int2 = 20;
        self.int3 = -30;
        self.int4 = 40;
        self.int5 = -5;
    }
}