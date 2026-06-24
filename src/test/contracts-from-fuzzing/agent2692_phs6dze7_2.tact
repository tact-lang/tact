contract ManyFields {
    a: Int;
    b: Bool;
    c: String;
    d: Slice;
    e: Cell;
    f: Address;
    g: Int?;
    h: Bool?;
    i: String?;
    j: Slice;
    k: Cell;
    l: Address;
    m: Int;
    n: Bool;
    o: String;
    p: Slice;
    q: Cell;
    r: Address;

    init() {
        self.a = 1;
        self.b = true;
        self.c = "str";
        self.d = emptyCell().asSlice();
        self.e = emptyCell();
        self.f = myAddress();
        self.g = null;
        self.h = null;
        self.i = null;
        self.j = emptyCell().asSlice();
        self.k = emptyCell();
        self.l = myAddress();
        self.m = 2;
        self.n = false;
        self.o = "abc";
        self.p = emptyCell().asSlice();
        self.q = emptyCell();
        self.r = myAddress();
    }
}
