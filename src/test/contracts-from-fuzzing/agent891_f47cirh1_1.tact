contract ManyFields {
    a: Int;
    b: Bool;
    c: Address;
    d: String;
    e: Cell;
    f: Slice;
    g: Builder;
    h: Int?;
    i: Address?;
    j: String?;
    k: Cell?;
    l: Slice?;
    m: Builder?;
    n: Bool?;

    init() {
        self.a = 1;
        self.b = true;
        self.c = myAddress();
        self.d = "ok";
        self.e = emptyCell();
        self.f = emptyCell().asSlice();
        self.g = beginCell();
        self.h = null;
        self.i = null;
        self.j = null;
        self.k = null;
        self.l = null;
        self.m = null;
        self.n = null;
    }
}
