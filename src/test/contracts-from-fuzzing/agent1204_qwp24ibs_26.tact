// contract uses explicit tiny serialization
contract TinyInts {
    a: Int as uint1;
    b: Int as uint4;
    c: Int as int4;
    d: Int as int1;

    init() {
        self.a = 1;
        self.b = 8;
        self.c = -3;
        self.d = -1;
    }
}