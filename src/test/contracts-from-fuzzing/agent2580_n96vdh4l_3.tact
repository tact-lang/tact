contract LongList {
    a: Int;
    b: Bool;
    c: String;
    d: Cell;
    e: Slice;
    f: Address;
    g: Bool;
    h: String;
    i: Int;
    j: Int?;
    k: Bool?;
    l: String;
    m: Address;
    n: Cell;
    o: Bool;
    p: String;
    q: Int;
    r: Int?;
    s: Cell;
    t: Bool;
    u: Address;
    v: String;
    w: Int;
    x: Bool;
    y: String;
    z: Int;

    init() {
        self.a = 1;
        self.b = true;
        self.c = "c";
        self.d = emptyCell();
        self.e = emptyCell().asSlice();
        self.f = myAddress();
        self.g = false;
        self.h = "h";
        self.i = 9;
        self.j = null;
        self.k = true;
        self.l = "l";
        self.m = myAddress();
        self.n = emptyCell();
        self.o = true;
        self.p = "p";
        self.q = 17;
        self.r = null;
        self.s = emptyCell();
        self.t = false;
        self.u = myAddress();
        self.v = "v";
        self.w = 23;
        self.x = true;
        self.y = "y";
        self.z = 26;
    }
}