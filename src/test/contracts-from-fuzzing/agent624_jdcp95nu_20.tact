contract ManyInts {
    a: Int as uint8 = 1;
    b: Int as int16 = -2;
    c: Int as uint32 = 3;
    d: Int as int64 = -4;
    e: Int as uint128 = 5;

    init() {
        self.a = 10;
        self.b = -20;
        self.c = 30;
        self.d = -40;
        self.e = 50;
    }
}