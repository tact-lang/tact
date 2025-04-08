contract TestContract {
    a: Int;
    b: Bool;
    c: String;
    d: Cell;
    e: Address;
    f: Slice;
    g: Int?;
    h: Bool?;
    i: String?;
    j: Cell?;
    k: Address?;
    l: Slice?;

    init() {
        self.a = 1;
        self.b = false;
        self.c = "hello";
        self.d = emptyCell();
        self.e = myAddress();
        self.f = emptyCell().asSlice();
        self.g = null;
        self.h = true;
        self.i = null;
        self.j = null;
        self.k = null;
        self.l = null;
    }
}