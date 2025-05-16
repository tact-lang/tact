contract SerializeFormats {
    a: Int as int64;
    b: Int as uint32;
    c: Int as int8;
    d: Int as uint4;
    e: Int as coins;

    init() {
        self.a = 10;
        self.b = 20;
        self.c = -5;
        self.d = 7;
        self.e = 1000;
    }
}
