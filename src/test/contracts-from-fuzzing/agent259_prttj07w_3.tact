contract LargeFieldList {
    a: Int;
    b: Bool;
    c: String;
    d: Address;
    e: Cell;
    f: Slice;
    g: Builder;
    h: Int?;
    i: Bool?;
    j: String?;
    k: Address?;
    l: Cell?;
    m: Slice?;
    n: Builder?;
    o: Int;
    p: Bool;
    q: String;
    r: Address;
    s: Cell;

    init() {
        self.a = 1;
        self.b = false;
        self.c = "abc";
        self.d = myAddress();
        self.e = emptyCell();
        self.f = self.e.asSlice();
        self.g = beginCell();
        self.h = null;
        self.i = null;
        self.j = null;
        self.k = null;
        self.l = null;
        self.m = null;
        self.n = null;
        self.o = 2;
        self.p = true;
        self.q = "def";
        self.r = myAddress();
        self.s = emptyCell();
    }
}
