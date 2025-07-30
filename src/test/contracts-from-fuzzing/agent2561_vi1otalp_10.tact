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
    j: Address;
    k: Cell;
    l: Slice;

    init() {
        self.a = 1;
        self.b = true;
        self.c = "hello";
        self.d = myAddress();
        self.e = emptyCell();
        self.f = emptyCell().asSlice();
        self.g = null;
        self.h = null;
        self.i = null;
        self.j = myAddress();
        self.k = emptyCell();
        self.l = emptyCell().asSlice();
    }
}