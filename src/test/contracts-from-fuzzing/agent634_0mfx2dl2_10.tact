contract OnlyFields {
    a: Int;
    b: String;
    c: Bool;
    d: Address;
    e: Cell;
    f: Slice;
    g: Builder;
    h: Int?;
    i: String?;
    j: Bool?;
    k: Address?;
    l: Cell?;
    m: Slice?;
    n: Builder?;

    init() {
        self.a = 1;
        self.b = "str";
        self.c = true;
        self.d = myAddress();
        self.e = emptyCell();
        self.f = emptyCell().asSlice();
        self.g = beginCell();
        self.h = 2;
        self.i = null;
        self.j = null;
        self.k = null;
        self.l = null;
        self.m = null;
        self.n = null;
    }
}
