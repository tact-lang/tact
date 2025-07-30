contract Test14 {
    a: Int as uint8 = 0;
    b: Int as uint16 = 0;
    c: Int as int5 = -5;
    d: Int as int257 = 123;

    init() {
        self.a = 255;
        self.b = 65535;
        self.c = 7;
        self.d = -9999999999999999;
    }
}