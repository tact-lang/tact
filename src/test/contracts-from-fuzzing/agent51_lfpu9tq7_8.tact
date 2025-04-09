contract TestLongFieldList {
    a: Int;
    b: Bool;
    c: String;
    d: Address;
    e: Cell;
    f: Slice;
    g: Int?;
    h: Bool?;
    i: String?;
    j: Address;
    k: Cell;
    l: Slice;
    m: Int?;
    n: Bool;
    o: String;
    p: Address;
    q: Cell;
    r: Slice;
    s: Int;
    t: Bool;

    init() {
        self.a = 1;
        self.b = true;
        self.c = "abc";
        self.d = myAddress();
        self.e = emptyCell();
        self.f = emptyCell().asSlice();
        self.g = null;
        self.h = null;
        self.i = null;
        self.j = myAddress();
        self.k = emptyCell();
        self.l = emptyCell().asSlice();
        self.m = 12;
        self.n = false;
        self.o = "xyz";
        self.p = myAddress();
        self.q = emptyCell();
        self.r = emptyCell().asSlice();
        self.s = 37;
        self.t = true;
    }
}
