contract SerializeFormats {
    a: Int as uint32;
    b: Int as int64;
    c: Int as uint8;
    d: Int as int257;
    e: Int as uint1;

    init() {
        self.a = 1;
        self.b = -2;
        self.c = 3;
        self.d = 4;
        self.e = 1;
    }
}