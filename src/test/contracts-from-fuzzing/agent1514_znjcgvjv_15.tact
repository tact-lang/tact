contract TrailingCommaMany {
    a: Int;
    b: Int;
    c: Int;
    d: Bool;
    e: String;
    f: Address;
    g: Cell;
    h: Slice;
    i: Builder;
    j: String?;
    k: Address?;
    l: Cell?;

    init() {
        self.a = 1;
        self.b = 2;
        self.c = 3;
        self.d = false;
        self.e = "hi";
        self.f = myAddress();
        self.g = emptyCell();
        self.h = emptyCell().asSlice();
        self.i = beginCell();
        self.j = null;
        self.k = null;
        self.l = null;
    }
}