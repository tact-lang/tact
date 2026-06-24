contract BorderInt {
    n1: Int as int1;    // -1..0
    u1: Int as uint1;  // 0..1
    n8: Int as int8;   // -128..127
    u8: Int as uint8;  // 0..255

    init() {
        self.n1 = -1;
        self.u1 = 1;
        self.n8 = 127;
        self.u8 = 255;
    }
}