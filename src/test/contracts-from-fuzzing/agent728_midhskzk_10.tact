contract TinyInts {
    flag: Bool;            // 1 bit
    smallu4: Int as uint4; // 4 bits
    smallu1: Int as uint1; // 1 bit
    smalli8: Int as int8;  // 8 bits

    init() {
        self.flag = true;
        self.smallu4 = 15;
        self.smallu1 = 1;
        self.smalli8 = -128;
    }
}