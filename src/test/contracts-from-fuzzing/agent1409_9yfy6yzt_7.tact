contract LotsOfFields {
    a: Int;
    b: Bool;
    c: String;
    d: Address;
    e: Cell;
    f: Slice;
    g: String;
    h: Bool;
    i: Int;
    j: Address;
    k: String;
    l: Cell;
    m: Slice;
    n: Int?;
    o: Bool?;
    p: String;
    q: Address;
    r: Cell;
    s: Slice;
    t: String;
    
    init() {
        self.a = 1;
        self.b = false;
        self.c = "a";
        self.d = myAddress();
        self.e = emptyCell();
        self.f = emptyCell().asSlice();
        self.g = "b";
        self.h = true;
        self.i = 2;
        self.j = myAddress();
        self.k = "c";
        self.l = emptyCell();
        self.m = emptyCell().asSlice();
        self.n = null;
        self.o = null;
        self.p = "d";
        self.q = myAddress();
        self.r = emptyCell();
        self.s = emptyCell().asSlice();
        self.t = "e";
    }
}