contract ManyPrimitives {
    a: Int;
    b: Bool;
    c: Slice;
    d: Cell;
    e: Address;
    f: String;
    g: Int?;
    h: Bool?;
    i: String?;
    j: Address?;
    k: Cell?;
    l: Slice?;
    init() {
        self.a = 1;
        self.b = true;
        self.c = emptyCell().asSlice();
        self.d = emptyCell();
        self.e = myAddress();
        self.f = "hi";
        self.g = null;
        self.h = null;
        self.i = null;
        self.j = null;
        self.k = null;
        self.l = null;
    }
}
