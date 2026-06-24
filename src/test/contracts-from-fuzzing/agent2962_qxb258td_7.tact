contract BitWidths {

    a: Int as uint4;    // 4 bits
    b: Int as uint8;    // 8 bits
    c: Int as uint16;   // 16 bits
    d: Int as int32;    // 32 bits signed
    e: Int as uint64;   // 64 bits
    f: Int as int128;   // 128 bits signed
    g: Int;             // 257 bits default

    init() {
        self.a = 7;
        self.b = 128;
        self.c = 30000;
        self.d = -2000000000;
        self.e = 9999999999;
        self.f = -999999999999999;
        self.g = 2;
    }
}