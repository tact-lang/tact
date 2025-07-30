contract TestContract {
    a: Int as uint1;
    b: Int as uint8;
    c: Int as int4;
    d: Int as uint16;
    e: Int as int10;

    init() {
        self.a = 1;
        self.b = 255;
        self.c = -5;
        self.d = 65535;
        self.e = -128;
    }
}