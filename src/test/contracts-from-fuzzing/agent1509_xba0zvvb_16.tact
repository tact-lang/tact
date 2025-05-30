contract SerializeIntFormats {
    a: Int as uint4 = 0;
    b: Int as uint8 = 0;
    c: Int as int4 = 0;
    d: Int as int8 = 0;

    init() {
        self.a = 15;
        self.b = 255;
        self.c = -8;
        self.d = -128;
    }

    receive() {
        let _ = self.a + self.b + self.c + self.d;
    }
}