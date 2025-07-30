contract ManyPrimitives {
    a: Int;
    b: Bool;
    c: Cell;
    d: Slice;
    e: Address;
    f: String;
    g: Int;
    h: Bool;
    i: Cell;
    j: Slice;
    k: Address;
    l: String;
    m: Int;
    n: Bool;
    o: Int;
    p: Bool;
    q: Int;

    init() {
        self.a = 1;
        self.b = true;
        self.c = emptyCell();
        self.d = emptyCell().asSlice();
        self.e = myAddress();
        self.f = "test";
        self.g = 2;
        self.h = false;
        self.i = emptyCell();
        self.j = emptyCell().asSlice();
        self.k = myAddress();
        self.l = "hello";
        self.m = 3;
        self.n = true;
        self.o = 4;
        self.p = false;
        self.q = 5;
    }
}
