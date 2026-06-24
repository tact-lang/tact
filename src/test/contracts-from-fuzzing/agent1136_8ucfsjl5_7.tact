contract ManyPrimitives {
    a: Int;
    b: Bool;
    c: Address;
    d: Slice;
    e: Cell;
    f: String;
    g: Int?;
    h: Bool?;
    i: String?;
    j: Address?;
    k: Slice?;
    l: Cell?;
    m: Int;
    n: Bool;
    o: String;

    init() {
        self.a = 1;
        self.b = true;
        self.c = myAddress();
        self.d = emptyCell().asSlice();
        self.e = emptyCell();
        self.f = "abc";
        self.g = null;
        self.h = null;
        self.i = null;
        self.j = null;
        self.k = null;
        self.l = null;
        self.m = 42;
        self.n = false;
        self.o = "xyz";
    }
}