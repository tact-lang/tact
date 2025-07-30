contract ManyOptionals {
    a: Int?;
    b: Int?;
    c: Bool?;
    d: Bool?;
    e: String?;
    f: String?;
    g: Cell?;
    h: Slice?;
    i: Address?;
    j: Cell?;

    init() {
        self.a = 1;
        self.b = null;
        self.c = true;
        self.d = null;
        self.e = "abc";
        self.f = null;
        self.g = null;
        self.h = null;
        self.i = null;
        self.j = emptyCell();
    }

    receive() {}
}
