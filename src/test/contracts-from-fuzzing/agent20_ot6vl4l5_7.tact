contract LargePersistence {
    a: Int;
    b: Bool;
    c: String;
    d: Address;
    e: Cell;
    f: Bool?;
    g: String?;
    h: Address;
    i: Int;
    j: Bool;
    k: String;
    l: Address;
    m: Cell;
    n: Int?;
    o: String?;
    p: Cell;

    init() {
        self.a = 1;
        self.b = true;
        self.c = "x";
        self.d = myAddress();
        self.e = emptyCell();
        self.f = null;
        self.g = null;
        self.h = myAddress();
        self.i = 2;
        self.j = false;
        self.k = "y";
        self.l = myAddress();
        self.m = emptyCell();
        self.n = null;
        self.o = null;
        self.p = emptyCell();
    }
}