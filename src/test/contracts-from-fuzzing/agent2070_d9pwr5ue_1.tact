contract ManyScalarFields {
    a: Int = 1;
    b: Bool = true;
    c: Int as uint8 = 8;
    d: Bool = false;
    e: Int as int64 = -64;
    f: Int as uint16 = 16;

    init() {
        self.a = 10;
        self.b = false;
        self.c = 255;
        self.d = true;
        self.e = -128;
        self.f = 65535;
    }
}
