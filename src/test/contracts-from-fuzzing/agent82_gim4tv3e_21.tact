contract FieldOrderTest {
    a: Int as uint8; // 8 bits
    b: Int as uint16; // 16 bits
    c: Int as uint32; // 32 bits
    d: Int as uint64; // 64 bits
    e: Int as uint4;  // 4 bits

    init() {
        self.a = 7;
        self.b = 255;
        self.c = 65535;
        self.d = 424242;
        self.e = 5;
    }
}
