// Test many fields contract, large storage
contract ManyFields {
    a: Int;
    b: Int?;
    c: Bool;
    d: String;
    e: Cell;
    f: Slice;
    g: Builder;
    h: Address;
    i: String?;
    j: Bool?;
    k: Int;
    l: Int?;
    m: String;
    n: Cell;
    o: Slice;
    p: Builder;
    q: Address;
    r: String?;
    s: Bool?;

    init() {
        self.a = 1;
        self.b = null;
        self.c = true;
        self.d = "test";
        self.e = emptyCell();
        self.f = emptyCell().asSlice();
        self.g = beginCell();
        self.h = myAddress();
        self.i = null;
        self.j = null;
        self.k = 2;
        self.l = null;
        self.m = "hi";
        self.n = emptyCell();
        self.o = emptyCell().asSlice();
        self.p = beginCell();
        self.q = myAddress();
        self.r = null;
        self.s = null;
    }
}