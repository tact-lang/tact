contract TestContract {
    a: Int as uint8 = 0;
    b: Int as int8 = 0;
    c: Int as uint16 = 0;
    d: Int as int16 = 0;
    e: Int as uint32 = 0;
    f: Int as int32 = 0;
    g: Int as uint64 = 0;
    h: Int as int64 = 0;
    i: Int as uint256 = 0;
    j: Int as int257 = 0;

    init() {
        self.a = 1;
        self.b = -1;
        self.c = 2;
        self.d = -2;
        self.e = 3;
        self.f = -3;
        self.g = 4;
        self.h = -4;
        self.i = 5;
        self.j = -5;
    }
}
