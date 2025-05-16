contract SerialVarious {
    a: Int as uint3;
    b: Int as int9;
    c: Int as uint128;
    d: Int as int256;

    init() {
        self.a = 7;
        self.b = -42;
        self.c = 123456789;
        self.d = -999999999;
    }
}