contract SerialPrimitiveMix {
    a: Int as int32;
    b: Int as uint128;
    c: Int as int8;
    d: Int = 5;

    init() {
        self.a = -77;
        self.b = 999;
        self.c = 1;
        self.d = 5;
    }
}