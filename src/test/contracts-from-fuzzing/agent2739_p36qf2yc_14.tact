contract LargePrimitive {
    a: Int as int257;
    b: Int as uint256;
    c: Int as int128;
    d: Int as uint1;
    e: Int as uint64;
    f: Int as int16;
    init() {
        self.a = 0;
        self.b = 0;
        self.c = 0;
        self.d = 1;
        self.e = 42;
        self.f = -1;
    }
}