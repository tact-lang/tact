contract ManyPrimitives {
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
    m: Int;
    n: Bool;

    init() {
        self.a = 1;
        self.b = false;
        self.c = myAddress();
        self.d = emptyCell();
        self.e = emptyCell().asSlice();
        self.f = "test";
        self.g = null;
        self.h = true;
        self.i = null;
        self.j = emptyCell();
        self.k = emptyCell().asSlice();
        self.l = "";
        self.m = 123;
        self.n = true;
    }
}