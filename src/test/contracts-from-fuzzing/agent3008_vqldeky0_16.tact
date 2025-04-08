contract MegaContract {
    a: Int;
    b: Bool;
    c: Address;
    d: Cell;
    e: Slice;
    f: Builder;
    g: String;
    h: Int?;
    i: String?;
    j: Address;
    k: Bool;
    l: Cell;
    m: Slice;
    n: Builder;
    o: String;
    p: Int?;
    q: String?;

    init() {
        self.a = 1;
        self.b = true;
        self.c = myAddress();
        self.d = emptyCell();
        self.e = emptyCell().asSlice();
        self.f = beginCell();
        self.g = "mega";
        self.h = null;
        self.i = null;
        self.j = myAddress();
        self.k = false;
        self.l = emptyCell();
        self.m = emptyCell().asSlice();
        self.n = beginCell();
        self.o = "contract";
        self.p = null;
        self.q = null;
    }
}