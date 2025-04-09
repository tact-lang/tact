contract ManyOptionals {
    a: Int?;
    b: Bool?;
    c: Address?;
    d: Cell?;
    e: Slice?;
    f: String?;
    g: Int?;
    h: Bool?;
    i: Address?;
    j: Cell?;

    init() {
        self.a = null;
        self.b = true;
        self.c = null;
        self.d = null;
        self.e = emptyCell().asSlice();
        self.f = "hello";
        self.g = 100;
        self.h = null;
        self.i = myAddress();
        self.j = emptyCell();
    }
}