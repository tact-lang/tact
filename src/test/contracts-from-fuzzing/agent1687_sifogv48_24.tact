contract Test {
    a: Int as uint2;
    b: Int as int4;
    c: Int as uint1;
    d: Int as int1;

    init() {
        self.a = 3;
        self.b = -7;
        self.c = 1;
        self.d = -1;
    }
}