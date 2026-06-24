contract SerializeFormats {
    a: Int as uint4;
    b: Int as int8;
    c: Int as uint16;
    d: Int as int32;
    e: Int as uint64;
    f: Int as int128;
    g: Int as uint256;

    init() {
        self.a = 5;
        self.b = -7;
        self.c = 42;
        self.d = -4242;
        self.e = 999999;
        self.f = -999999;
        self.g = 123456789;
    }
}