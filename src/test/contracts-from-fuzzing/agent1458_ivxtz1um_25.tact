contract SerializeFormats {
    a: Int as int64;
    b: Int as uint32;
    c: Int as int257;
    d: Int as coins;

    init() {
        self.a = 11;
        self.b = 12;
        self.c = 13;
        self.d = 14;
    }
}