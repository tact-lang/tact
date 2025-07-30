contract ManyFields {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: Bool?;
    f: String?;
    g: Cell;
    h: Cell?;
    i: Slice;
    j: Slice?;
    k: Builder;
    l: Builder?;
    m: Address;
    n: Address?;

    init() {
        self.a = 1;
        self.b = true;
        self.c = "str";
        self.d = null;
        self.e = true;
        self.f = null;
        self.g = emptyCell();
        self.h = null;
        self.i = emptyCell().asSlice();
        self.j = null;
        self.k = beginCell();
        self.l = null;
        self.m = myAddress();
        self.n = null;
    }
}