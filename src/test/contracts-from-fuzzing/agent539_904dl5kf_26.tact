contract OrderedFields {
    a: Int as uint8;
    b: Int as int64;
    c: Int as uint4;
    d: Int as int257;
    init() {
        self.a = 4;
        self.b = 64;
        self.c = 2;
        self.d = 1;
    }
}