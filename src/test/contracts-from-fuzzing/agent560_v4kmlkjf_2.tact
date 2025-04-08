contract Test {
    a: Int;
    b: Bool;
    c: Cell;
    d: Slice;
    e: String;
    f: Address;
    g: Int?;
    h: Bool?;
    i: Cell?;
    j: Slice?;
    k: String?;
    l: Address?;

    init() {
        self.a = 1;
        self.b = true;
        self.c = emptyCell();
        self.d = emptyCell().asSlice();
        self.e = "test";
        self.f = myAddress();
        self.g = null;
        self.h = null;
        self.i = null;
        self.j = null;
        self.k = null;
        self.l = null;
    }
}