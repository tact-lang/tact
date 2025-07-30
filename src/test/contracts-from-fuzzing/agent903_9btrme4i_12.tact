contract LotsOfPrimitives {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: Bool?;
    f: String?;
    g: Address;
    h: Cell;
    i: Slice;
    j: Address?;
    k: Cell?;
    l: Slice?;

    init() {
        self.a = 1;
        self.b = true;
        self.c = "x";
        self.d = null;
        self.e = false;
        self.f = null;
        self.g = myAddress();
        self.h = emptyCell();
        self.i = emptyCell().asSlice();
        self.j = null;
        self.k = null;
        self.l = null;
    }
}