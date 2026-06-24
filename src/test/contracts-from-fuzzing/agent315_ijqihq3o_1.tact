contract LongFields {
    a: Int;
    b: Bool;
    c: String;
    d: Cell;
    e: Slice;
    f: Address;
    g: Int?;
    h: Bool?;
    i: String?;
    j: Cell;
    k: Int;
    l: Bool;
    m: String;
    n: Cell;
    o: Slice;
    p: Address;
    q: Int?;
    r: Bool?;
    s: String?;
    t: Cell;

    init() {
        self.a = 0;
        self.b = true;
        self.c = "test";
        self.d = emptyCell();
        self.e = self.d.asSlice();
        self.f = myAddress();
        self.g = null;
        self.h = null;
        self.i = null;
        self.j = emptyCell();
        self.k = 1;
        self.l = false;
        self.m = "again";
        self.n = emptyCell();
        self.o = self.n.asSlice();
        self.p = myAddress();
        self.q = 123;
        self.r = true;
        self.s = "foo";
        self.t = emptyCell();
    }
}