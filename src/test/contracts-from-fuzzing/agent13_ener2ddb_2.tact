contract LargeContract {
    a: Int;
    b: Int;
    c: Bool;
    d: Address;
    e: Cell;
    f: Slice;
    g: Builder;
    h: String;
    i: Bool?;
    j: Int?;
    k: String?;
    l: Address?;
    m: Cell?;
    n: Slice?;
    o: Builder?;

    init() {
        self.a = 1;
        self.b = 2;
        self.c = true;
        self.d = myAddress();
        self.e = emptyCell();
        self.f = emptyCell().asSlice();
        self.g = beginCell();
        self.h = "test";
        self.i = true;
        self.j = 123;
        self.k = null;
        self.l = null;
        self.m = null;
        self.n = null;
        self.o = null;
    }
}