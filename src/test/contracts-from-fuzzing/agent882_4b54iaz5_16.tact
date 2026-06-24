contract MixedPrimitiveArray {
    a: Int;
    b: Int?;
    c: Bool;
    d: Bool?;
    e: Address;
    f: Address?;
    g: String;
    h: String?;
    i: Cell;
    j: Cell?;
    k: Slice;
    l: Slice?;
    m: Builder;
    n: Builder?;

    init() {
        self.a = 1;
        self.b = null;
        self.c = true;
        self.d = null;
        self.e = myAddress();
        self.f = null;
        self.g = "s";
        self.h = null;
        self.i = emptyCell();
        self.j = null;
        self.k = emptyCell().asSlice();
        self.l = null;
        self.m = beginCell();
        self.n = null;
    }
}