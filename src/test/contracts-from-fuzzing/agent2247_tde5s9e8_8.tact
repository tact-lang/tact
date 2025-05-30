contract TestOrder {
    a: Int as uint8;
    b: Int as int8;
    c: Int;
    d: Int as uint128;
    e: Int as int128;

    init() {
        self.a = 1;
        self.b = -1;
        self.c = 123456;
        self.d = 456789;
        self.e = -654321;
    }
}
