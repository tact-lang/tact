contract TestContract {
    a: Int;
    b: Bool;
    c: Int?;
    d: Bool?;
    e: String;
    f: String?;
    g: Cell;
    h: Cell?;
    i: Address;
    j: Address?;
    k: Slice;
    l: Slice?;

    init() {
        self.a = 1;
        self.b = true;
        self.c = null;
        self.d = false;
        self.e = "abc";
        self.f = null;
        self.g = emptyCell();
        self.h = null;
        self.i = myAddress();
        self.j = null;
        self.k = emptyCell().asSlice();
        self.l = null;
    }
}