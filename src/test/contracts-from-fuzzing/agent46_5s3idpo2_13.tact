contract LargePrimitives {
    a: Int as uint64;
    b: Int as int256;
    c: Int as uint128;

    init() {
        self.a = 10;
        self.b = -20;
        self.c = 30;
    }
}
