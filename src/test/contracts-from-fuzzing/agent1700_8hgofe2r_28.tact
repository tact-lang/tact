contract ManyPrimitives {
    a: Int;
    b: Bool;
    c: String;
    d: Address;
    e: Cell;
    f: Slice;
    g: Bool?;
    h: Int?;
    i: String?;
    j: Address?;
    k: Slice?;
    l: Cell?;

    init() {
        self.a = 1;
        self.b = false;
        self.c = "hello";
        self.d = sender();
        self.e = emptyCell();
        self.f = emptyCell().asSlice();
        self.g = null;
        self.h = null;
        self.i = null;
        self.j = null;
        self.k = null;
        self.l = null;
    }
}