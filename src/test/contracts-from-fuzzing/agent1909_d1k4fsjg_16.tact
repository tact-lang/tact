contract LargeMixedFields {
    a: Int as uint4;
    b: Int;
    c: Bool;
    d: Address;
    e: Cell;
    f: Slice;
    g: String;
    h: Int?;
    i: Bool?;
    j: Address?;
    k: Cell?;
    l: Slice?;
    m: String?;

    init() {
        self.a = 10;
        self.b = -999999999;
        self.c = true;
        self.d = myAddress();
        self.e = emptyCell();
        self.f = self.e.asSlice();
        self.g = "test";
        self.h = null;
        self.i = null;
        self.j = null;
        self.k = null;
        self.l = null;
        self.m = null;
    }
}