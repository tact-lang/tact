contract Test {
    a: Int;
    b: Int;
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
    m: Int;
    n: Int?;
    o: Bool;
    p: Bool?;
    q: String;
    r: String?;
    s: Address;
    t: Address?;

    init() {
        self.a = 1;
        self.b = 2;
        self.c = true;
        self.d = null;
        self.e = "foo";
        self.f = null;
        self.g = myAddress();
        self.h = null;
        self.i = emptyCell();
        self.j = null;
        self.k = emptyCell().asSlice();
        self.l = null;
        self.m = 3;
        self.n = null;
        self.o = false;
        self.p = null;
        self.q = "bar";
        self.r = null;
        self.s = myAddress();
        self.t = null;
    }
}