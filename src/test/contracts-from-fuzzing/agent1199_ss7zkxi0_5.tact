contract TestContract {
    a: Int;
    b: Int?;
    c: Bool;
    d: Bool?;
    e: Cell;
    f: Cell?;
    g: Address;
    h: Address?;
    i: String;
    j: String?;
    k: Int;
    l: Bool;
    m: Cell;
    n: Address;
    o: String;

    init() {
        self.a = 1;
        self.b = null;
        self.c = true;
        self.d = null;
        self.e = emptyCell();
        self.f = null;
        self.g = myAddress();
        self.h = null;
        self.i = "foo";
        self.j = null;
        self.k = 0;
        self.l = false;
        self.m = emptyCell();
        self.n = myAddress();
        self.o = "bar";
    }
}