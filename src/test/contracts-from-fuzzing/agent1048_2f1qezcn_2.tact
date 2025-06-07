contract LongList {
    a: Int;
    b: Int;
    c: Bool;
    d: Bool;
    e: Address;
    f: String;
    g: String;
    h: Cell;
    i: Slice;
    j: Builder;
    k: Int?;
    l: Bool?;
    m: Address?;
    n: String?;
    o: Cell?;
    p: Slice?;
    q: Builder?;
    
    init() {
        self.a = 1;
        self.b = 2;
        self.c = true;
        self.d = false;
        self.e = myAddress();
        self.f = "test";
        self.g = "another";
        self.h = emptyCell();
        self.i = emptyCell().asSlice();
        self.j = beginCell();
        self.k = null;
        self.l = null;
        self.m = null;
        self.n = null;
        self.o = null;
        self.p = null;
        self.q = null;
    }
}