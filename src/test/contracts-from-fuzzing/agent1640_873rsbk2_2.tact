contract DiverseFields {
    a: Int;
    b: Int as uint32;
    c: Int as int64;
    d: Int as coins;
    e: Bool;
    f: Bool?;

    init() {
        self.a = 1;
        self.b = 2;
        self.c = 3;
        self.d = 4;
        self.e = true;
        self.f = false;
    }
}