contract OnlyOptionals {
    a: Int?;
    b: Int?;
    c: Bool?;
    d: Bool?;
    e: String?;
    f: String?;
    g: Int?;
    h: String?;
    i: Int?;
    j: Bool?;

    init() {
        self.a = 1;
        self.b = null;
        self.c = true;
        self.d = null;
        self.e = "e";
        self.f = null;
        self.g = 7;
        self.h = "h";
        self.i = null;
        self.j = false;
    }
}