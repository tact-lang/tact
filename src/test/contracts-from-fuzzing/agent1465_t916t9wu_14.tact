contract ManyPersistent {
    a: Int;
    b: Bool;
    c: Address;
    d: String;
    e: Slice;
    f: Cell;
    g: Int?;
    h: Bool?;
    i: Address?;
    j: String?;
    k: Slice?;
    l: Cell?;

    init() {
        self.a = 1;
        self.b = true;
        self.c = myAddress();
        self.d = "hi";
        self.e = emptyCell().asSlice();
        self.f = emptyCell();
        self.g = null;
        self.h = null;
        self.i = null;
        self.j = null;
        self.k = null;
        self.l = null;
    }
}