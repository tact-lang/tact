contract IntSerials {
    a: Int as int16;
    b: Int as int32;
    c: Int as int64;
    d: Int as int128;
    e: Int as int256;
    f: Int;

    init() {
        self.a = -10;
        self.b = -1000;
        self.c = -100000;
        self.d = -1000000000;
        self.e = -10000000000000;
        self.f = -1;
    }
}