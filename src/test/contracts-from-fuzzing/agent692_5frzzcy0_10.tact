contract ManyIntFormats {
    a: Int as int64;
    b: Int as uint64;
    c: Int as uint8;
    d: Int as int16;
    e: Int as uint16;
    f: Int as uint256;
    g: Int as int257;

    init() {
        self.a = 1;
        self.b = 2;
        self.c = 3;
        self.d = -4;
        self.e = 5;
        self.f = 6;
        self.g = 7;
    }
}