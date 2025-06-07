contract LongFields {
    a: Int;
    b: Int;
    c: Bool;
    d: Bool;
    e: Int?;
    f: Int?;
    g: String;
    h: String?;
    i: Cell;
    j: Cell?;
    k: Slice;
    l: Slice?;
    m: Address;
    n: Address?;

    init() {
        self.a = 1;
        self.b = 2;
        self.c = true;
        self.d = false;
        self.e = null;
        self.f = null;
        self.g = "g";
        self.h = null;
        self.i = emptyCell();
        self.j = null;
        self.k = emptyCell().asSlice();
        self.l = null;
        self.m = myAddress();
        self.n = null;
    }
}