contract Test18 {
    a: Int;
    b: Bool;
    c: Address;
    d: Cell;
    e: Slice;
    f: String;
    g: Int?;
    h: Bool?;
    i: String?;
    j: Address;
    k: Int as uint32;
    l: Int as int64;

    init() {
        self.a = 1;
        self.b = true;
        self.c = myAddress();
        self.d = emptyCell();
        self.e = self.d.asSlice();
        self.f = "x";
        self.g = null;
        self.h = null;
        self.i = null;
        self.j = myAddress();
        self.k = 42;
        self.l = -789;
    }
}