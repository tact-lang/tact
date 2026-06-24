contract TestFlat {
    a: Int = 1;
    b: Bool = true;
    c: Address;
    d: Cell;
    e: Slice;
    f: String = "foo";
    g: Slice?;
    h: Int?;
    i: String?;
    j: Address?;
    init() {
        self.a = 123;
        self.b = false;
        self.c = myAddress();
        self.d = emptyCell();
        self.e = emptyCell().asSlice();
        self.f = "bar";
        self.g = null;
        self.h = null;
        self.i = null;
        self.j = null;
    }
}
