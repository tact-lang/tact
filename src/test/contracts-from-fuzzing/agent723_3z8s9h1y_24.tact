contract ComplexOptionals {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Cell?;
    e: Address?;
    f: Int?;
    g: Bool?;
    h: String?;
    i: Cell?;
    j: Address?;

    init() {
        self.a = null;
        self.b = null;
        self.c = null;
        self.d = null;
        self.e = null;
        self.f = 10;
        self.g = true;
        self.h = "hi";
        self.i = emptyCell();
        self.j = myAddress();
    }
}