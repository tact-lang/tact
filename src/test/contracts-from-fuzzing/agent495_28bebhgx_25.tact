contract DifferentOrderSerialization {
    a: Int as int64;
    b: Bool;
    c: Int as uint128;
    d: Bool;
    e: Int as int256;

    init() {
        self.a = 1;
        self.b = false;
        self.c = 2;
        self.d = true;
        self.e = 3;
    }
}
