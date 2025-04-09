contract ManyFields {
    a: Int;
    b: Bool;
    c: Int?;
    d: Bool?;
    e: String;
    f: String?;
    g: Address;
    h: Cell;
    i: Slice;
    j: Address?;
    k: Cell?;
    l: Slice?;

    init() {
        self.a = 1;
        self.b = true;
        self.c = null;
        self.d = null;
        self.e = "yo";
        self.f = null;
        self.g = myAddress();
        self.h = emptyCell();
        self.i = emptyCell().asSlice();
        self.j = null;
        self.k = null;
        self.l = null;
    }
}
