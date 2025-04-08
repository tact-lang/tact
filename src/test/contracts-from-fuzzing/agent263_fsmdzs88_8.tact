contract ManyFields {
    a: Int;
    b: Bool;
    c: Address;
    d: Cell;
    e: Slice;
    f: String;
    g: Int;
    h: Bool;
    i: Address;
    j: Cell;
    k: Slice;
    l: String;
    m: Int;
    n: Bool;
    o: Address;
    p: Cell;

    init() {
        self.a = 1;
        self.b = true;
        self.c = myAddress();
        self.d = emptyCell();
        self.e = self.d.asSlice();
        self.f = "a";
        self.g = 2;
        self.h = false;
        self.i = myAddress();
        self.j = emptyCell();
        self.k = self.j.asSlice();
        self.l = "b";
        self.m = 3;
        self.n = true;
        self.o = myAddress();
        self.p = emptyCell();
    }
}