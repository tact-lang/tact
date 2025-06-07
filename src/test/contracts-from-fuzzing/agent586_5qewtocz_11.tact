contract LotsOfOptionals {
    a: Int?;
    b: Int?;
    c: Int?;
    d: Int?;
    e: String?;
    f: Bool?;
    g: String?;
    h: Bool?;
    i: String?;
    j: Int?;

    init() {
        self.a = null;
        self.b = null;
        self.c = null;
        self.d = null;
        self.e = null;
        self.f = null;
        self.g = null;
        self.h = null;
        self.i = null;
        self.j = null;
    }

    receive() {
        self.a = self.a;
    }
}