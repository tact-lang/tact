contract ManyPrimitives {
    a: Int;
    b: Bool;
    c: Address;
    d: Cell;
    e: Slice;
    f: Builder;
    g: String;
    h: Int?;
    i: Bool?;
    j: String?;
    k: Address;
    l: Cell;
    m: Slice;
    n: Builder;

    init() {
        self.a = 1;
        self.b = true;
        self.c = myAddress();
        self.d = emptyCell();
        self.e = beginCell().endCell().asSlice();
        self.f = beginCell();
        self.g = "hello";
        self.h = null;
        self.i = false;
        self.j = null;
        self.k = myAddress();
        self.l = emptyCell();
        self.m = beginCell().endCell().asSlice();
        self.n = beginCell();
    }
}