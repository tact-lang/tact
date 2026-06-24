contract LongFields {
    a: Int;
    b: String;
    c: Int?;
    d: Bool;
    e: Address;
    f: Cell;
    g: Slice;
    h: String?;
    i: Address?;
    j: Bool?;
    k: Cell?;
    l: Slice?;
    m: Int;
    n: Bool;
    o: Int?;
    p: String;
    q: Address;
    r: Int;
    s: Bool?;
    t: String?;

    init() {
        self.a = 1;
        self.b = "b";
        self.c = null;
        self.d = true;
        self.e = myAddress();
        self.f = emptyCell();
        self.g = emptyCell().asSlice();
        self.h = null;
        self.i = null;
        self.j = null;
        self.k = null;
        self.l = null;
        self.m = 2;
        self.n = false;
        self.o = null;
        self.p = "p";
        self.q = myAddress();
        self.r = 3;
        self.s = null;
        self.t = null;
    }
}
