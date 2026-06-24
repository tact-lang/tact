contract TestContract {
    a: Int;
    b: Int?;
    c: Int as uint32;
    d: Int? as uint32;
    e: Bool;
    f: Bool?;
    g: Address;
    h: Address?;
    i: Cell;
    j: Cell?;
    k: Slice;
    l: Slice?;
    m: String;
    n: String?;
    o: Int;
    p: Int?;
    q: Bool;
    r: Bool?;
    s: Int as uint64;
    t: Int? as uint64;

    init() {
        self.a = 1;
        self.b = null;
        self.c = 2;
        self.d = null;
        self.e = true;
        self.f = null;
        self.g = myAddress();
        self.h = null;
        self.i = emptyCell();
        self.j = null;
        self.k = emptyCell().asSlice();
        self.l = null;
        self.m = "hi";
        self.n = null;
        self.o = 3;
        self.p = null;
        self.q = false;
        self.r = null;
        self.s = 4;
        self.t = null;
    }
}