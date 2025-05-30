contract ManyInts {
    a: Int;
    b: Int as uint32;
    c: Int as int32;
    d: Int as uint16;
    e: Int as int16;
    f: Int;

    init() {
        self.a = 1;
        self.b = 2;
        self.c = -3;
        self.d = 4;
        self.e = -5;
        self.f = 6;
    }
}
