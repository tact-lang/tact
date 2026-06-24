contract LargeStateVariables {
    a: Int as int8 = 1;
    b: Int as int16 = 2;
    c: Int as uint32 = 3;
    d: Int as uint64 = 4;
    e: Int as int128 = 5;
    f: Int as uint128 = 6;
    g: Int as int257 = 7;

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