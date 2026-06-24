contract LargeMixedFields {
    a: Int;
    b: Int as uint32;
    c: Int as int64;
    d: Int as uint4;
    e: Bool;
    f: String;
    g: Cell;
    h: Address;
    i: Slice;
    j: Int?;
    k: Bool?;
    l: String?;
    m: Address?;

    init() {
        self.a = 1;
        self.b = 2;
        self.c = 3;
        self.d = 4;
        self.e = true;
        self.f = "ok";
        self.g = emptyCell();
        self.h = myAddress();
        self.i = emptyCell().asSlice();
        self.j = null;
        self.k = null;
        self.l = null;
        self.m = null;
    }
}