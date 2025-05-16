contract LargeOptionals {
    a: Int?;
    b: Int?;
    c: Int?;
    d: Int?;
    e: String?;
    f: String?;
    g: Bool?;
    h: Bool?;
    i: Cell?;
    j: Slice?;

    init() {
        self.a = null;
        self.b = 2;
        self.c = null;
        self.d = 4;
        self.e = "e";
        self.f = null;
        self.g = true;
        self.h = null;
        self.i = emptyCell();
        self.j = emptyCell().asSlice();
    }
}