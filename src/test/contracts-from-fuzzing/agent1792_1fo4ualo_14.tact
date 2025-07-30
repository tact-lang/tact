contract LargeContract {
    a: Int;
    b: Bool;
    c: String;
    d: Cell;
    e: Slice;
    f: Address;
    g: Int?;
    h: Bool?;
    i: String;
    j: Cell;
    k: Slice;
    l: Address;
    m: Int;
    n: Bool;
    o: String;
    p: Int?;
    q: Bool?;
    r: String;
    s: Int;
    t: Bool;

    init() {
        self.a = 1;
        self.b = false;
        self.c = "c";
        self.d = emptyCell();
        self.e = emptyCell().asSlice();
        self.f = myAddress();
        self.g = null;
        self.h = null;
        self.i = "i";
        self.j = emptyCell();
        self.k = emptyCell().asSlice();
        self.l = myAddress();
        self.m = 100;
        self.n = true;
        self.o = "o";
        self.p = null;
        self.q = null;
        self.r = "r";
        self.s = 999;
        self.t = true;
    }
}