contract HugeMix {
    a: Int;
    b: Bool;
    c: String;
    d: Cell;
    e: Slice;
    f: Address;
    g: Int?;
    h: Bool?;
    i: Int;
    j: Bool;
    k: String;
    l: Cell;
    m: Slice;
    n: Address;
    o: Int?;
    p: Bool?;
    q: Int;
    r: Bool;
    s: String;
    t: Address;

    init() {
        self.a = 1;
        self.b = true;
        self.c = "c";
        self.d = emptyCell();
        self.e = emptyCell().asSlice();
        self.f = myAddress();
        self.g = null;
        self.h = false;
        self.i = 9;
        self.j = true;
        self.k = "k";
        self.l = emptyCell();
        self.m = emptyCell().asSlice();
        self.n = myAddress();
        self.o = null;
        self.p = true;
        self.q = 17;
        self.r = false;
        self.s = "s";
        self.t = myAddress();
    }
}