contract SerialUintMax {
    a: Int as uint4;
    b: Int as uint8;
    c: Int as uint16;

    init() {
        self.a = 15; // max for 4 bits
        self.b = 255; // max for 8 bits
        self.c = 65535; // max for 16 bits
    }
}