contract ManyFields {
    a: Int;
    b: Bool;
    c: String;
    d: Cell;
    e: Address;
    f: Slice;
    g: Bool;
    h: String;
    i: Int;
    j: Bool;
    k: Int;
    l: String;
    m: Bool;
    n: String;
    o: Int;
    p: Int;
    q: Bool;
    r: Cell;
    s: String;
    t: Address;

    init() {
        self.a = 0;
        self.b = false;
        self.c = "c";
        self.d = emptyCell();
        self.e = myAddress();
        self.f = emptyCell().asSlice();
        self.g = true;
        self.h = "h";
        self.i = 9;
        self.j = true;
        self.k = 11;
        self.l = "l";
        self.m = true;
        self.n = "n";
        self.o = 15;
        self.p = 16;
        self.q = false;
        self.r = emptyCell();
        self.s = "s";
        self.t = myAddress();
    }
}
