contract LargeOptionalMix {
    a: Int?;
    b: Int?;
    c: Bool?;
    d: Address?;
    e: String?;
    f: Int?;
    g: String?;
    h: Bool?;
    i: Address?;
    j: Int?;

    init() {
        self.a = null;
        self.b = 5;
        self.c = true;
        self.d = null;
        self.e = "x";
        self.f = null;
        self.g = "y";
        self.h = false;
        self.i = myAddress();
        self.j = 42;
    }
}
