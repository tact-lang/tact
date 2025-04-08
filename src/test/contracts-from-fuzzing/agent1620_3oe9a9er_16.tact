contract LargeMixed {
    a: Int;
    b: Int?;
    c: Bool;
    d: Bool?;
    e: String;
    f: String?;
    g: Cell;
    h: Cell?;
    i: Slice;
    j: Slice?;
    k: Address;
    l: Address?;
    m: Int as int64;
    n: Int as uint64;
    o: Int as int32;
    p: Int as uint32;
    q: Int as int16;
    r: Int as uint16;
    s: Int as int8;
    t: Int as uint8;

    init() {
        self.a = 1;
        self.b = null;
        self.c = true;
        self.d = null;
        self.e = "a";
        self.f = null;
        self.g = emptyCell();
        self.h = null;
        self.i = emptyCell().asSlice();
        self.j = null;
        self.k = myAddress();
        self.l = null;
        self.m = 2;
        self.n = 3;
        self.o = 4;
        self.p = 5;
        self.q = 6;
        self.r = 7;
        self.s = 8;
        self.t = 9;
    }
}