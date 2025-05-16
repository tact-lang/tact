contract Test12 {
    bit1: Bool;
    bit2: Bool;
    bit3: Bool;
    bit4: Bool;
    n4: Int as uint4;
    n8: Int as uint8;
    n16: Int as int16;
    n32: Int as uint32;
    n64: Int as int64;
    init() {
        self.bit1 = true;
        self.bit2 = false;
        self.bit3 = true;
        self.bit4 = false;
        self.n4 = 15;
        self.n8 = 255;
        self.n16 = -12345;
        self.n32 = 123456789;
        self.n64 = -1234567890123;
    }
}
