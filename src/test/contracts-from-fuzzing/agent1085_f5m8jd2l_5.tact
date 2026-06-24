contract LongFlatFields {
    a: Int;
    b: Bool;
    c: String;
    d: Slice;
    e: Cell;
    f: Builder;
    g: Address;
    h: Bool?;
    i: Int?;
    j: String;
    k: Slice;
    l: Cell;
    m: Builder;
    n: Address;
    o: Bool;
    p: Bool;
    q: String;
    r: Address;
    s: Cell;
    t: Bool?;
    u: Int;
    v: String;
    w: Cell;
    x: Address;
    y: Bool;
    z: Int;

    init() {
        self.a = 1;
        self.b = false;
        self.c = "a";
        self.d = emptyCell().asSlice();
        self.e = emptyCell();
        self.f = beginCell();
        self.g = myAddress();
        self.h = null;
        self.i = 10;
        self.j = "b";
        self.k = emptyCell().asSlice();
        self.l = emptyCell();
        self.m = beginCell();
        self.n = myAddress();
        self.o = true;
        self.p = false;
        self.q = "c";
        self.r = myAddress();
        self.s = emptyCell();
        self.t = true;
        self.u = 3;
        self.v = "d";
        self.w = emptyCell();
        self.x = myAddress();
        self.y = false;
        self.z = 123;
    }
}