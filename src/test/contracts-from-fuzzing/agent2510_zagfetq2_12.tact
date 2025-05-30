contract LargeFields {
    a: Int;
    b: Bool;
    c: String;
    d: Slice;
    e: Cell;
    f: Address;
    g: Int?;
    h: String?;
    i: Bool?;
    j: Slice?;
    k: Cell?;
    l: Address?;

    init() {
        self.a = -5;
        self.b = true;
        self.c = "test";
        self.d = emptyCell().asSlice();
        self.e = emptyCell();
        self.f = myAddress();
        self.g = null;
        self.h = null;
        self.i = null;
        self.j = null;
        self.k = null;
        self.l = null;
    }
}