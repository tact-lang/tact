contract SerialOpts {
    a: Int? as uint32;
    b: Int? as int64;
    c: Int? as coins;
    d: Int?;

    init() {
        self.a = null;
        self.b = null;
        self.c = null;
        self.d = null;
    }
}