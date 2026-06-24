contract SerializationWidth {
    a: Int as uint3;   // 0..7
    b: Int as uint7;   // 0..127
    c: Int as int9;    // -256..255
    d: Int as int15;   // -16384..16383
    e: Int as uint12;  // 0..4095
    f: Int as int5;    // -16..15

    init() {
        self.a = 5;
        self.b = 100;
        self.c = -20;
        self.d = 1000;
        self.e = 2048;
        self.f = -8;
    }
}