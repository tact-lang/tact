contract LargeVarMix {
    a: Int;
    b: Int?;
    c: Bool;
    d: Bool?;
    e: String;
    f: String?;
    g: Address;
    h: Address?;
    i: Slice;
    j: Slice?;
    k: Cell;
    l: Cell?;

    init() {
        self.a = 1;
        self.b = 2;
        self.c = true;
        self.d = false;
        self.e = "hi";
        self.f = "there";
        self.g = myAddress();
        self.h = myAddress();
        self.i = emptyCell().asSlice();
        self.j = emptyCell().asSlice();
        self.k = emptyCell();
        self.l = emptyCell();
    }
}