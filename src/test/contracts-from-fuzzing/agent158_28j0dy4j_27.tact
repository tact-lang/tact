contract ChainOptionals {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Cell?;
    e: Slice?;
    f: Int?;
    g: Bool?;
    h: String?;
    i: Cell?;
    j: Slice?;

    init() {
        self.a = null;
        self.b = true;
        self.c = null;
        self.d = emptyCell();
        self.e = emptyCell().asSlice();
        self.f = 42;
        self.g = false;
        self.h = "str";
        self.i = null;
        self.j = emptyCell().asSlice();
    }
}