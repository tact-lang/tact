contract Big {
    a: Int;
    b: Bool;
    c: Cell;
    d: Int as uint8;
    e: Bool;
    f: Cell;
    g: String;
    h: Address;
    i: String;
    j: Bool;
    k: Cell;
    l: Int;
    m: Address;
    n: String;
    o: Bool;
    p: Cell;
    q: String;
    r: Int as int32;
    s: Bool;
    t: Cell;
    u: String;
    v: Address;
    w: Int;
    x: Bool;
    y: Cell;
    z: String;

    init() {
        self.a = 1;
        self.b = true;
        self.c = emptyCell();
        self.d = 2;
        self.e = false;
        self.f = emptyCell();
        self.g = "g";
        self.h = myAddress();
        self.i = "i";
        self.j = true;
        self.k = emptyCell();
        self.l = 3;
        self.m = myAddress();
        self.n = "n";
        self.o = false;
        self.p = emptyCell();
        self.q = "q";
        self.r = 42;
        self.s = true;
        self.t = emptyCell();
        self.u = "u";
        self.v = myAddress();
        self.w = 7;
        self.x = false;
        self.y = emptyCell();
        self.z = "z";
    }
}
