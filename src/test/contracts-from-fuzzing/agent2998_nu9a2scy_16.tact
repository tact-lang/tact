contract BigTupleFields {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: Bool;
    f: String?;
    g: Cell;
    h: Slice;
    i: Address;
    j: Int;
    k: Bool;
    l: String;
    m: Int?;
    n: Bool;
    o: String?;
    p: Cell;
    q: Slice;
    r: Address;

    init() {
        self.a = 1;
        self.b = true;
        self.c = "c";
        self.d = null;
        self.e = false;
        self.f = null;
        self.g = emptyCell();
        self.h = emptyCell().asSlice();
        self.i = myAddress();
        self.j = 9;
        self.k = true;
        self.l = "l";
        self.m = null;
        self.n = false;
        self.o = "string";
        self.p = emptyCell();
        self.q = emptyCell().asSlice();
        self.r = myAddress();
    }
}