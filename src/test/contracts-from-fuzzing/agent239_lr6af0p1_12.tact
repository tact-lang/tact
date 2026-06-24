contract JustManyFields {
    a: Int;
    b: Bool;
    c: String;
    d: Cell;
    e: Slice;
    f: Address;
    g: Bool?;
    h: Int?;
    i: String?;
    j: Int as int64;

    init() {
        self.a = 1;
        self.b = true;
        self.c = "hi";
        self.d = emptyCell();
        self.e = self.d.asSlice();
        self.f = myAddress();
        self.g = null;
        self.h = null;
        self.i = null;
        self.j = -42;
    }
}