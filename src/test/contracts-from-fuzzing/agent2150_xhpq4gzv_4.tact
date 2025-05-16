// Contract with many mixed persistent fields
contract TestContract {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: Bool?;
    f: String?;
    g: Cell;
    h: Cell?;
    i: Builder;
    j: Builder?;
    k: Slice;
    l: Slice?;
    m: Address;
    n: Address?;

    init() {
        self.a = 7;
        self.b = true;
        self.c = "test";
        self.d = null;
        self.e = null;
        self.f = null;
        self.g = emptyCell();
        self.h = null;
        self.i = beginCell();
        self.j = null;
        self.k = emptyCell().asSlice();
        self.l = null;
        self.m = myAddress();
        self.n = null;
    }
}