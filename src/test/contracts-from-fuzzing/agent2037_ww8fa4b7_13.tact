contract ManyOptionalsDirect {
    a: Int?;
    b: Int?;
    c: Int?;
    d: Int?;
    e: Bool?;
    f: Bool?;
    g: String?;
    h: String?;
    i: Address?;
    j: Cell?;
    k: Slice?;
    l: Builder?;

    init() {
        self.a = 1;
        self.b = null;
        self.c = 2;
        self.d = null;
        self.e = true;
        self.f = null;
        self.g = "g";
        self.h = null;
        self.i = null;
        self.j = null;
        self.k = null;
        self.l = null;
    }
}
