contract LargeComposite {
    a: Int as int64;
    b: String;
    c: Bool;
    d: Int?;
    e: Bool?;
    f: String?;
    g: Int as uint128;
    h: Bool;
    i: Int?;
    j: String;
    k: Bool?;
    l: Int as uint4;

    init() {
        self.a = 1;
        self.b = "hi";
        self.c = true;
        self.d = null;
        self.e = false;
        self.f = null;
        self.g = 123456789123456789;
        self.h = false;
        self.i = null;
        self.j = "yo";
        self.k = true;
        self.l = 7;
    }
}