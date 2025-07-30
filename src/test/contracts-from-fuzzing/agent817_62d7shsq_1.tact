contract ManyFields {
    a: Int;
    b: Bool;
    c: String;
    d: Slice;
    e: Cell;
    f: Int?;
    g: Bool?;
    h: String?;
    i: Slice?;
    j: Cell?;

    init() {
        self.a = 1;
        self.b = true;
        self.c = "hi";
        self.d = emptyCell().asSlice();
        self.e = emptyCell();
        self.f = 42;
        self.g = false;
        self.h = null;
        self.i = null;
        self.j = null;
    }
}