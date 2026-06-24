contract EdgeCaseContract {
    // Mix of many optional and non-optional primitives
    a: Int?;
    b: Int;
    c: Bool?;
    d: Bool;
    e: String?;
    f: String;
    g: Slice?;
    h: Slice;
    i: Cell?;
    j: Cell;
    k: Address?;
    l: Address;

    init() {
        self.a = null;
        self.b = 1;
        self.c = null;
        self.d = false;
        self.e = null;
        self.f = "hi";
        self.g = null;
        self.h = emptyCell().asSlice();
        self.i = null;
        self.j = emptyCell();
        self.k = null;
        self.l = myAddress();
    }
}
