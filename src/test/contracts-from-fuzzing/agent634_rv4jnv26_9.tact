// large flat contract fields list fuzz
contract LotsOfFields {
    a: Int;
    b: Bool;
    c: String;
    d: Int;
    e: Bool;
    f: String;
    g: Cell;
    h: Slice;
    i: Address;
    j: Bool;
    k: Int;
    l: Bool;
    m: String;
    n: Int;
    o: Bool;
    p: String;
    q: Cell;
    r: Slice;
    s: Address;
    t: Bool;
    u: Int;
    v: Bool;
    w: String;
    x: Int;
    y: Bool;
    z: String;

    init() {
        self.a = 0;
        self.b = true;
        self.c = "c";
        self.d = 1;
        self.e = false;
        self.f = "f";
        self.g = emptyCell();
        self.h = emptyCell().asSlice();
        self.i = myAddress();
        self.j = false;
        self.k = -1;
        self.l = true;
        self.m = "m";
        self.n = 10;
        self.o = true;
        self.p = "p";
        self.q = emptyCell();
        self.r = emptyCell().asSlice();
        self.s = myAddress();
        self.t = false;
        self.u = 100;
        self.v = true;
        self.w = "w";
        self.x = 17;
        self.y = false;
        self.z = "z";
    }
}