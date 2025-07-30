// Wide contract with many primitive persistent vars
contract TestContract {
    a: Int;
    b: Int as uint8;
    c: Int as int16;
    d: Int as uint32;
    e: Int as int64;
    f: Int as uint128;
    g: Int as int257;
    h: Bool;
    i: Bool;
    j: Bool;
    k: Bool;
    l: Int?;
    m: Bool?;
    n: Int?;
    o: Bool?;

    init() {
        self.a = -5;
        self.b = 255;
        self.c = -12345;
        self.d = 1234567;
        self.e = -9999999999;
        self.f = 123456789123456789;
        self.g = -123456789123456789123456789;
        self.h = true;
        self.i = false;
        self.j = true;
        self.k = false;
        self.l = null;
        self.m = null;
        self.n = 999;
        self.o = true;
    }
}
