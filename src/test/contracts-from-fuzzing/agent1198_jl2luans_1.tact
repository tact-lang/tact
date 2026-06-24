contract ManyFields {
    a: Int;
    b: Bool;
    c: String;
    d: Cell;
    e: Slice;
    f: Builder;
    g: Address;
    h: Int?;
    i: Bool?;
    j: Address?;
    k: Cell?;
    l: Slice?;
    m: Builder?;

    init() {
        self.a = 1;
        self.b = true;
        self.c = "test";
        self.d = emptyCell();
        self.e = emptyCell().asSlice();
        self.f = beginCell();
        self.g = myAddress();
        self.h = null;
        self.i = null;
        self.j = null;
        self.k = null;
        self.l = null;
        self.m = null;
    }
}