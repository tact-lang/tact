contract Wide {
    a: Int;
    b: Int;
    c: Int;
    d: Int;
    e: Int;
    f: Int;
    g: Int;
    h: Bool;
    i: Bool;
    j: Bool;
    k: Address;
    l: Cell;
    m: Slice;
    n: String;
    o: Int;
    p: Int;
    q: Int;
    r: Bool;
    s: Address;
    t: String;
    u: Cell;

    init() {
        self.a = 1;
        self.b = 2;
        self.c = 3;
        self.d = 4;
        self.e = 5;
        self.f = 6;
        self.g = 7;
        self.h = true;
        self.i = false;
        self.j = true;
        self.k = myAddress();
        self.l = emptyCell();
        self.m = emptyCell().asSlice();
        self.n = "abc";
        self.o = 8;
        self.p = 9;
        self.q = 10;
        self.r = false;
        self.s = myAddress();
        self.t = "def";
        self.u = emptyCell();
    }
}
