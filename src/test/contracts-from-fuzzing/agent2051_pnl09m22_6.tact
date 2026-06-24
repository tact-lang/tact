contract LotsOfFields {
    a: Int;
    b: Bool;
    c: Address;
    d: Cell;
    e: Slice;
    f: String;
    g: Int?;
    h: Bool?;
    i: Address?;
    j: Cell?;
    k: Slice?;
    l: String?;

    init() {
        self.a = 1;
        self.b = true;
        self.c = myAddress();
        self.d = emptyCell();
        self.e = self.d.asSlice();
        self.f = "hi";
        self.g = null;
        self.h = true;
        self.i = null;
        self.j = emptyCell();
        self.k = self.j.asSlice();
        self.l = "bye";
    }
}