contract ManyTypes {
    a: Int;
    b: Bool;
    c: Cell;
    d: Builder;
    e: Slice;
    f: Address;
    g: String;
    h: Int?;
    i: Bool?;
    j: Cell?;
    k: Builder?;
    l: Slice?;
    m: Address?;
    n: String?;

    init() {
        self.a = 1;
        self.b = true;
        self.c = emptyCell();
        self.d = beginCell();
        self.e = emptyCell().asSlice();
        self.f = myAddress();
        self.g = "test";
        self.h = null;
        self.i = null;
        self.j = null;
        self.k = null;
        self.l = null;
        self.m = null;
        self.n = null;
    }
}