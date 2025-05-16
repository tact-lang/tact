contract ManyIntSerializations {
    a: Int as uint1;
    b: Int as int8;
    c: Int as uint32;
    d: Int as int64;
    e: Int as uint128;

    init() {
        self.a = 1;
        self.b = 5;
        self.c = 50;
        self.d = 5000;
        self.e = 5000000;
    }
}