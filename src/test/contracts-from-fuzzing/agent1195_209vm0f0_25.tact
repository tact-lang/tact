contract OptInits {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Int as uint16;
    e: Int as int8;

    init() {
        self.a = null;
        self.b = null;
        self.c = null;
        self.d = 15;
        self.e = -8;
    }
}
