contract BigContract {
    a: Int;
    b: Bool;
    c: String;
    d: Cell;
    e: Slice;
    f: Builder;
    g: Address;
    h: Int?;
    i: Bool?;
    j: String?;
    k: Cell?;
    l: Slice?;
    m: Builder?;
    n: Address?;

    init() {
        self.a = 1;
        self.b = true;
        self.c = "hello";
        self.d = emptyCell();
        self.e = emptyCell().asSlice();
        self.f = beginCell();
        self.g = myAddress();
        self.h = 2;
        self.i = false;
        self.j = "world";
        self.k = emptyCell();
        self.l = emptyCell().asSlice();
        self.m = beginCell();
        self.n = myAddress();
    }
}
