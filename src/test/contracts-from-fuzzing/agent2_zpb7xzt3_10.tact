contract TestContract {
    a: Int;
    b: Int?;
    c: Bool;
    d: Bool?;
    e: Address?;
    f: String;
    g: String?;
    h: Cell?;
    i: Slice?;
    j: Int;
    k: Int?;
    l: Bool;
    m: Bool?;
    n: Address?;
    o: String;
    p: String?;
    q: Cell?;
    r: Slice?;
    init() {
        self.a = 10;
        self.b = 20;
        self.c = true;
        self.d = null;
        self.e = null;
        self.f = "A";
        self.g = "B";
        self.h = emptyCell();
        self.i = null;
        self.j = 30;
        self.k = null;
        self.l = false;
        self.m = true;
        self.n = null;
        self.o = "C";
        self.p = null;
        self.q = emptyCell();
        self.r = emptyCell().asSlice();
    }
}