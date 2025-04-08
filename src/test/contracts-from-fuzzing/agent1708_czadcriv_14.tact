contract TestContract {
    a: Int as uint8;      // 8 bit
    b: Int as uint16;     // 16 bit
    c: Int as int32;     // 32 bit signed
    d: Int as uint64;     // 64 bit unsigned
    e: Int as int128;    // 128 bit signed
    f: Int as uint256;    // 256 bit unsigned
    g: Int;               // default 257-bit signed

    init() {
        self.a = 1;
        self.b = 2;
        self.c = 3;
        self.d = 4;
        self.e = 5;
        self.f = 6;
        self.g = 7;
    }
}