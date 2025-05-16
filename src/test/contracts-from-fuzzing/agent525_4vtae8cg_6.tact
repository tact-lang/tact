contract ManyFields {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: String?;
    f: Bool?;
    g: Slice;
    h: Cell;
    i: Address;
    j: Int;
    k: Bool;
    l: String;
    m: Int?;
    n: String?;
    o: Cell;
    p: Address;

    init() {
        self.a = 1;
        self.b = true;
        self.c = "s";
        self.d = null;
        self.e = null;
        self.f = false;
        self.g = emptyCell().asSlice();
        self.h = emptyCell();
        self.i = myAddress();
        self.j = 2;
        self.k = false;
        self.l = "x";
        self.m = 3;
        self.n = "hi";
        self.o = emptyCell();
        self.p = myAddress();
    }
}