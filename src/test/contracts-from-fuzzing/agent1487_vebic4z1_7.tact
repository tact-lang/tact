contract BigInts {
    a: Int as int1;    // 1 bit
    b: Int as int8;   // 8 bit
    c: Int as int16;  // 16 bit
    d: Int as int32;  // 32 bit
    e: Int as int64;  // 64 bit
    f: Int as int128; // 128 bit
    g: Int as int256; // 256 bit
    h: Int;           // 257 bit default

    init() {
        self.a = 0;
        self.b = 0;
        self.c = 0;
        self.d = 0;
        self.e = 0;
        self.f = 0;
        self.g = 0;
        self.h = 0;
    }
}