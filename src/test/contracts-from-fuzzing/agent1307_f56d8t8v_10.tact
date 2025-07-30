contract ManyStateVars {
    a: Int;
    b: Bool;
    c: String;
    d: Cell;
    e: Slice;
    f: Address;
    g: Int?;
    h: Bool?;
    i: String?;
    j: Cell?;
    k: Slice?;
    l: Address?;

    init() {
        self.a = 1;
        self.b = false;
        self.c = "abc";
        self.d = emptyCell();
        self.e = emptyCell().asSlice();
        self.f = myAddress();
        self.g = null;
        self.h = true;
        self.i = null;
        self.j = null;
        self.k = null;
        self.l = null;
    }
}