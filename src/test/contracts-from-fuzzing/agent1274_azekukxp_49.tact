contract ManyFieldsWithOptionals {
    a: Int;
    b: Int?;
    c: Bool;
    d: Bool?;
    e: String;
    f: String?;
    g: Address;
    h: Address?;
    i: Cell;
    j: Cell?;
    k: Slice;
    l: Slice?;

    init() {
        self.a = 1;
        self.b = null;
        self.c = true;
        self.d = null;
        self.e = "hi";
        self.f = null;
        self.g = myAddress();
        self.h = null;
        self.i = emptyCell();
        self.j = null;
        self.k = emptyCell().asSlice();
        self.l = null;
    }
}