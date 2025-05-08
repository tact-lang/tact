contract ManyMixedFields {
    a: Int as int64;
    b: Int as uint64;
    c: Bool;
    d: String;
    e: Cell;
    f: Slice;
    g: Int?;
    h: Bool?;
    i: String?;
    j: Slice?;

    init() {
        self.a = -50;
        self.b = 50;
        self.c = true;
        self.d = "ok";
        self.e = emptyCell();
        self.f = emptyCell().asSlice();
        self.g = null;
        self.h = null;
        self.i = null;
        self.j = null;
    }
}