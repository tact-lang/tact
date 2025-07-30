contract TestContract {
    a: Int as uint1;
    b: Int as uint8;
    c: Int as int16;
    d: Int as uint32;
    e: Int as int64;
    f: Int as uint128;
    g: Int as int257;

    init() {
        self.a = 1;
        self.b = 255;
        self.c = -32768;
        self.d = 4294967295;
        self.e = -9223372036854775808;
        self.f = 340282366920938463463374607431768211455;
        self.g = -57896044618658097711785492504343953926634992332820282019728792003956564819968;
    }
}