contract ManyPrimitives {
    a: Int;
    b: Bool;
    c: Int?;
    d: Address;
    e: Cell;
    f: Slice;
    g: String;
    h: Bool?;
    i: String;
    j: Address;
    k: Slice;
    l: Cell;
    m: Bool;
    n: Int;
    o: String;

    init() {
        self.a = 1;
        self.b = false;
        self.c = null;
        self.d = myAddress();
        self.e = emptyCell();
        self.f = emptyCell().asSlice();
        self.g = "A";
        self.h = true;
        self.i = "B";
        self.j = myAddress();
        self.k = emptyCell().asSlice();
        self.l = emptyCell();
        self.m = true;
        self.n = 100;
        self.o = "C";
    }
}