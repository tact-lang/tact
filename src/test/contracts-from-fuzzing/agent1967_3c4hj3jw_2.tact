contract TestContract {
    a: Int as uint4;
    b: Int as int16;
    c: Int as uint32;
    d: Int as int64;
    e: Int as uint128;
    f: Int as int257;

    init() {
        self.a = 8;
        self.b = -23;
        self.c = 123456;
        self.d = 90000000;
        self.e = 123123123123123;
        self.f = 9999999999999999999999999;
    }
}