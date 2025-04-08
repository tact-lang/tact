contract ManyFields {
    a: Int;
    b: Int;
    c: Int;
    d: Bool;
    e: Bool;
    f: Bool;
    g: String;
    h: String;
    i: String;
    j: Address;
    k: Address;
    l: Address;
    m: Cell;
    n: Cell;
    o: Cell;
    p: Slice;
    q: Slice;
    r: Slice;

    init() {
        self.a = 1;
        self.b = 2;
        self.c = 3;
        self.d = true;
        self.e = false;
        self.f = true;
        self.g = "g";
        self.h = "h";
        self.i = "i";
        self.j = myAddress();
        self.k = myAddress();
        self.l = myAddress();
        self.m = emptyCell();
        self.n = emptyCell();
        self.o = emptyCell();
        self.p = emptyCell().asSlice();
        self.q = emptyCell().asSlice();
        self.r = emptyCell().asSlice();
    }
}