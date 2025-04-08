contract LargeFields {
    a: Int;
    b: Bool;
    c: Address;
    d: Int?;
    e: Bool?;
    f: String;
    g: String?;
    h: Int = 42;
    i: Bool = false;
    j: Address;
    k: Int?;
    l: String;
    m: Cell;
    n: Slice;
    o: Cell?;
    p: Slice?;

    init() {
        self.a = 1;
        self.b = true;
        self.c = myAddress();
        self.d = null;
        self.e = null;
        self.f = "hello";
        self.g = null;
        self.j = myAddress();
        self.k = null;
        self.l = "world";
        self.m = emptyCell();
        self.n = emptyCell().asSlice();
        self.o = null;
        self.p = null;
    }
}
