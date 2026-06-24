contract ManyFields {
    a: Int;
    b: Bool;
    c: Int?;
    d: Bool?;
    e: Cell;
    f: Cell?;
    g: Slice;
    h: Slice?;
    i: Builder;
    j: Builder?;
    k: Address;
    l: Address?;

    init() {
        self.a = 1;
        self.b = true;
        self.c = null;
        self.d = false;
        self.e = emptyCell();
        self.f = null;
        self.g = emptyCell().asSlice();
        self.h = null;
        self.i = beginCell();
        self.j = null;
        self.k = myAddress();
        self.l = null;
    }
}