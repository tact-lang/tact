contract IntFormats {
    a: Int as uint3 = 0;
    b: Int as int3 = 0;
    c: Int as uint9 = 0;
    d: Int as int9 = 0;
    e: Int as uint17 = 0;
    f: Int as int17 = 0;

    init() {
        self.a = 7;
        self.b = -4;
        self.c = 511;
        self.d = -256;
        self.e = 131071;
        self.f = -65536;
    }

    receive() {
        let _ = self.a + self.b + self.c + self.d + self.e + self.f;
    }
}