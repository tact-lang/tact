contract ManyFieldsTest {
    a: Int;
    b: Bool;
    c: Address;
    d: Cell;
    e: Slice;
    f: String;
    g: Bool;
    h: Cell;
    i: Int;
    j: Address;
    k: String;
    l: Slice;
    m: Bool;
    n: Int;
    o: String;
    p: Cell;
    q: Address;
    r: Bool;
    s: Int;
    t: Slice;
    u: String;
    v: Address;
    w: Bool;
    x: Cell;
    y: Slice;
    z: Int;
    
    init() {
        self.a = 1;
        self.b = true;
        self.c = myAddress();
        self.d = emptyCell();
        self.e = emptyCell().asSlice();
        self.f = "f";
        self.g = false;
        self.h = emptyCell();
        self.i = 9;
        self.j = myAddress();
        self.k = "k";
        self.l = emptyCell().asSlice();
        self.m = true;
        self.n = 14;
        self.o = "o";
        self.p = emptyCell();
        self.q = myAddress();
        self.r = false;
        self.s = 19;
        self.t = emptyCell().asSlice();
        self.u = "u";
        self.v = myAddress();
        self.w = true;
        self.x = emptyCell();
        self.y = emptyCell().asSlice();
        self.z = 26;
    }
}