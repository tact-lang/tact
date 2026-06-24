contract IntSerialization {
    a: Int as uint8;       // unsigned 8-bit
    b: Int as int4;       // signed 4-bit
    c: Int as uint64;     // unsigned 64-bit
    d: Int as int16;      // signed 16-bit

    init() {
        self.a = 200;
        self.b = -3;
        self.c = 123456789;
        self.d = -12345;
    }
}