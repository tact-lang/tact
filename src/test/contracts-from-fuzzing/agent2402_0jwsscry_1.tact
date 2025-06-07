contract ManyFields {
    a: Int;
    b: Bool;
    c: Address;
    d: Cell;
    e: Builder;
    f: Slice;
    g: String;
    h: Int?;
    i: Bool?;
    j: Address?;
    k: Cell?;
    l: Builder?;
    m: Slice?;
    n: String?;

    init() {
        self.a = 0;
        self.b = false;
        self.c = myAddress();
        self.d = emptyCell();
        self.e = beginCell();
        self.f = emptyCell().asSlice();
        self.g = "";
        self.h = null;
        self.i = null;
        self.j = null;
        self.k = null;
        self.l = null;
        self.m = null;
        self.n = null;
    }
}