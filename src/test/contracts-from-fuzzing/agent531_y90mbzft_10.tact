contract ManyInts {
    a: Int as int8 = 1;
    b: Int as int16 = 2;
    c: Int as int32 = 3;
    d: Int as uint8 = 4;
    e: Int as uint16 = 5;
    f: Int as uint32 = 6;
    g: Int as coins = 7;

    init() {
        self.a = -1;
        self.b = -2;
        self.c = -3;
        self.d = 8;
        self.e = 9;
        self.f = 10;
        self.g = 11;
    }
}