contract Test {
    a: Int as int8;
    b: Int as uint4;
    c: Int as uint128;

    init() {
        self.a = 5;
        self.b = 12;
        self.c = 123456789;
    }
}