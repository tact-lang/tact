contract Test {
    a: Int = 0;
    b: Bool = false;
    c: Int?;
    d: Bool?;
    e: Int as uint8;
    f: Int as int64;

    init() {
        self.a = 1;
        self.b = true;
        self.c = null;
        self.d = null;
        self.e = 200;
        self.f = -100;
    }
}