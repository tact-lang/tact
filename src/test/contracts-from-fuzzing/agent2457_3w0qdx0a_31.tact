contract IntSizes {
    a: Int as uint8;
    b: Int as int16;
    c: Int as uint32;
    d: Int as int64;

    init() {
        self.a = 1;
        self.b = -100;
        self.c = 50000;
        self.d = -99999999;
    }
}