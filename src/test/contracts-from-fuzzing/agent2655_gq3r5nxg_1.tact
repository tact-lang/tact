contract LargeFieldList {
    a: Int;
    b: Bool;
    c: Address;
    d: Cell;
    e: Slice;
    f: String;
    g: Int?;
    h: Bool?;
    i: Address?;
    j: Cell?;
    k: Slice?;
    l: String?;
    m: Int as uint8;
    n: Int as int16;
    o: Int as uint32;
    p: Int as int64;
    q: Int as coins;
    r: Int as int257;
    s: Bool;
    t: Address;
    init() {
        self.a = 1;
        self.b = true;
        self.c = myAddress();
        self.d = emptyCell();
        self.e = emptyCell().asSlice();
        self.f = "hello";
        self.g = null;
        self.h = null;
        self.i = null;
        self.j = null;
        self.k = null;
        self.l = null;
        self.m = 255;
        self.n = -32768;
        self.o = 4294967295;
        self.p = -9223372036854775808;
        self.q = ton("1");
        self.r = 0;
        self.s = false;
        self.t = myAddress();
    }
}