contract TestContract {
    a: Int;
    b: Bool;
    c: String;
    d: Address;
    e: Cell;
    f: Slice;
    g: Builder;
    h: Int?;
    i: Bool?;
    j: String?;
    k: Address;
    l: Cell;
    m: Slice;
    n: Builder;

    init() {
        let c_ = emptyCell();
        self.a = 1;
        self.b = false;
        self.c = "abc";
        self.d = myAddress();
        self.e = c_;
        self.f = c_.asSlice();
        self.g = beginCell();
        self.h = null;
        self.i = null;
        self.j = null;
        self.k = myAddress();
        self.l = c_;
        self.m = c_.asSlice();
        self.n = beginCell();
    }
}