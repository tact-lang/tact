contract Test {
    a: Int;
    b: Bool;
    c: String;
    d: Cell;
    e: Slice;
    f: Address;
    g: Int?;
    h: Bool?;
    i: Cell?;
    j: Slice?;
    k: Address?;
    init() {
        self.a = 1;
        self.b = true;
        self.c = "test";
        self.d = emptyCell();
        self.e = emptyCell().asSlice();
        self.f = myAddress();
        self.g = null;
        self.h = null;
        self.i = null;
        self.j = null;
        self.k = null;
    }
}