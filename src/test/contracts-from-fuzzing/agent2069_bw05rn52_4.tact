contract ManyFields {
    a: Int;
    b: Bool;
    c: String;
    d: Cell;
    e: Slice;
    f: Address;
    g: Int?;
    h: Bool?;
    i: String;
    j: Bool;
    k: Int;
    l: Int;
    m: Bool;
    n: String;
    o: Slice;
    p: Address;

    init() {
        self.a = 1;
        self.b = true;
        self.c = "hi";
        self.d = emptyCell();
        self.e = emptyCell().asSlice();
        self.f = myAddress();
        self.g = null;
        self.h = null;
        self.i = "";
        self.j = false;
        self.k = 42;
        self.l = -42;
        self.m = true;
        self.n = "bye";
        self.o = emptyCell().asSlice();
        self.p = myAddress();
    }
}