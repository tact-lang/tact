contract LotsOfFields {
    a: Int;
    b: Bool;
    c: Int?;
    d: Bool?;
    e: String;
    f: String?;
    g: Address;
    h: Address?;
    i: Cell;
    j: Cell?;
    k: Slice;
    l: Slice?;

    init() {
        self.a = 1;
        self.b = true;
        self.c = null;
        self.d = null;
        self.e = "hello";
        self.f = null;
        self.g = myAddress();
        self.h = null;
        self.i = emptyCell();
        self.j = null;
        self.k = emptyCell().asSlice();
        self.l = null;
    }
}