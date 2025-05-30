contract OnlyFields {
    a: Int;
    b: Bool;
    c: String;
    d: Cell;
    e: Slice;
    f: Address;
    g: Int?;
    h: String?;
    i: Bool?;
    j: Slice;

    init() {
        self.a = 1;
        self.b = true;
        self.c = "ok";
        self.d = emptyCell();
        self.e = emptyCell().asSlice();
        self.f = myAddress();
        self.g = null;
        self.h = null;
        self.i = null;
        self.j = emptyCell().asSlice();
    }
}