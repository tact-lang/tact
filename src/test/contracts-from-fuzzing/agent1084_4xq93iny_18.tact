contract SerializeFormats {
    a: Int as uint4;
    b: Int as int64;
    c: Int as uint32;
    d: Int as int8;

    init() {
        self.a = 3;
        self.b = 42;
        self.c = 1024;
        self.d = -7;
    }
}