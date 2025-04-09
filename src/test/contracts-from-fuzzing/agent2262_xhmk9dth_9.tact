contract Test {
    a: Int as int4;
    b: Int as uint4;
    c: Int as int8;
    d: Int as uint8;
    e: Int as int16;
    f: Int as uint16;

    init() {
        self.a = -5;   // out of range intentionally → must cause range error at runtime, but compile
        self.b = 16;   // out of range seed, similar
        self.c = 127;
        self.d = 255;
        self.e = 32767;
        self.f = 65535;
    }
}