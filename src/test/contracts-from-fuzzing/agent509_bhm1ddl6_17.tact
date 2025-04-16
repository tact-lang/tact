contract ManyOptionals {
    a: Bool?;
    b: Int?;
    c: Cell?;
    d: Slice?;
    e: String?;
    f: Bool?;
    g: Int?;
    h: Cell?;
    i: Slice?;
    j: String?;

    init() {
        self.a = null;
        self.b = null;
        self.c = null;
        self.d = null;
        self.e = null;
        self.f = true;
        self.g = 10;
        self.h = emptyCell();
        self.i = emptyCell().asSlice();
        self.j = "test";
    }
}