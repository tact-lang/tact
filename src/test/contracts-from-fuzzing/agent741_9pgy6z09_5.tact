contract LargePersistent {
    a: Int;
    b: Bool;
    c: String;
    d: Address;
    e: Cell;
    f: Slice;
    g: Builder;
    h: Bool?;
    i: Int?;
    j: String?;
    k: Address?;

    init() {
        self.a = 1;
        self.b = true;
        self.c = "hello";
        self.d = myAddress();
        self.e = emptyCell();
        self.f = emptyCell().asSlice();
        self.g = beginCell();
        self.h = null;
        self.i = null;
        self.j = null;
        self.k = null;
    }
}