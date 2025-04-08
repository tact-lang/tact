contract ContractLargeFields {
    a: Int;
    b: Bool;
    c: String;
    d: Cell;
    e: Address;
    f: Slice;
    g: Int?;
    h: String?;
    i: Bool?;
    j: Cell?;
    k: Address?;
    l: Slice?;
    m: Int;
    n: Bool;
    o: String;
    p: Cell;
    q: Address;
    r: Slice;
    init() {
        self.a = 1;
        self.b = true;
        self.c = "abc";
        self.d = emptyCell();
        self.e = myAddress();
        self.f = emptyCell().asSlice();
        self.g = 2;
        self.h = null;
        self.i = false;
        self.j = null;
        self.k = null;
        self.l = null;
        self.m = 5;
        self.n = false;
        self.o = "xyz";
        self.p = emptyCell();
        self.q = myAddress();
        self.r = emptyCell().asSlice();
    }
}
