contract LotsOfFields {
    a: Int;
    b: Bool;
    c: String;
    d: Cell;
    e: Slice;
    f: Address;
    g: Int?;
    h: Bool?;
    i: String;
    j: Int;
    k: Bool;
    l: Cell;
    m: Slice;
    n: Address;
    o: Int?;
    p: Bool?;

    init() {
        self.a = 1;
        self.b = true;
        self.c = "abc";
        self.d = emptyCell();
        self.e = emptyCell().asSlice();
        self.f = myAddress();
        self.g = null;
        self.h = false;
        self.i = "def";
        self.j = 42;
        self.k = false;
        self.l = emptyCell();
        self.m = emptyCell().asSlice();
        self.n = myAddress();
        self.o = 7;
        self.p = true;
    }
}