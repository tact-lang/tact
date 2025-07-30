// Test large flat contract storage
contract LotsOfVars {
    a: Int;
    b: Bool;
    c: Int?;
    d: Bool?;
    e: String;
    f: String?;
    g: Cell;
    h: Slice;
    i: Builder;
    j: Address;
    k: Int;
    l: Bool;
    m: Int?;
    n: Bool?;
    o: String;
    p: String?;
    q: Cell;
    r: Slice;
    s: Builder;
    t: Address;

    init() {
        self.a = 1;
        self.b = true;
        self.c = null;
        self.d = false;
        self.e = "a";
        self.f = null;
        self.g = emptyCell();
        self.h = emptyCell().asSlice();
        self.i = beginCell();
        self.j = myAddress();
        self.k = 2;
        self.l = false;
        self.m = 3;
        self.n = null;
        self.o = "b";
        self.p = "c";
        self.q = emptyCell();
        self.r = emptyCell().asSlice();
        self.s = beginCell();
        self.t = myAddress();
    }
}