contract EdgeNumeric {
    a: Int as uint1;
    b: Int as int4;
    c: Int as uint16;

    init() {
        self.a = 1;
        self.b = -8;
        self.c = 65535;
    }
}