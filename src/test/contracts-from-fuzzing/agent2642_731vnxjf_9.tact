contract MultiFields {
    a: Int;
    b: Bool;
    c: Address;
    d: String;
    e: Cell;
    f: Slice;
    g: Int?;
    h: Bool?;
    i: Address?;
    j: String?;
    k: Cell?;
    l: Slice?;
    init() {
        self.a = 1;
        self.b = true;
        self.c = myAddress();
        self.d = "hello";
        self.e = emptyCell();
        self.f = emptyCell().asSlice();
        self.g = null;
        self.h = false;
        self.i = null;
        self.j = null;
        self.k = null;
        self.l = null;
    }
}