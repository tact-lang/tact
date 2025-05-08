contract LargeFields {
    a: Int;
    b: Int;
    c: Bool;
    d: Bool;
    e: String;
    f: Address;
    g: Cell;
    h: Slice;
    i: Builder;
    j: String;
    k: Address;
    l: Cell;
    m: Slice;
    n: Builder;
    o: Bool;
    p: Int;
    q: Int;
    r: Int;
    s: Int;
    t: Int;
    u: Int;
    v: Int;

    init() {
        self.a = 1;
        self.b = 2;
        self.c = true;
        self.d = false;
        self.e = "a";
        self.f = myAddress();
        self.g = emptyCell();
        self.h = emptyCell().asSlice();
        self.i = beginCell();
        self.j = "b";
        self.k = myAddress();
        self.l = emptyCell();
        self.m = emptyCell().asSlice();
        self.n = beginCell();
        self.o = false;
        self.p = 3;
        self.q = 4;
        self.r = 5;
        self.s = 6;
        self.t = 7;
        self.u = 8;
        self.v = 9;
    }
}
