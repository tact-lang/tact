contract TestContract {
    a: Int as uint4 = 1;
    b: Int as int8 = -5;
    c: Int as uint16 = 65535;
    d: Int as int32 = -123456;
    e: Int as uint64 = 1234567890123;
    f: Int as int128 = -170141183460469231731687303715884105728;
    g: Int as uint256 = 115792089237316195423570985008687907853269984665640564039457584007913129639935;
    h: Bool = true;

    init() {
        self.a = 10;
        self.b = -1;
        self.c = 42;
        self.d = -42;
        self.e = 123;
        self.f = -123;
        self.g = 456;
        self.h = false;
    }
}