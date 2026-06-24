contract ContractWithManyFields {
    a: Int;
    b: Bool;
    c: String;
    d: Cell;
    e: Bool?;
    f: Int?;
    g: String?;
    h: Bool;
    i: Int;
    j: String;
    k: Cell;
    l: Int?;
    m: String?;
    n: Bool?;
    o: Int;
    init() {
        self.a = 1;
        self.b = true;
        self.c = "test";
        self.d = emptyCell();
        self.e = null;
        self.f = null;
        self.g = null;
        self.h = false;
        self.i = 2;
        self.j = "hello";
        self.k = emptyCell();
        self.l = null;
        self.m = null;
        self.n = null;
        self.o = 3;
    }
}