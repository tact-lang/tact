contract ComplexTypes {
    a: Int;
    b: Bool;
    c: String;
    d: Address;
    e: Slice;
    f: Cell;
    g: Int?;
    h: Bool?;
    i: String?;
    j: Address?;
    k: Slice?;
    l: Cell?;

    init() {
        self.a = 123;
        self.b = true;
        self.c = "s";
        self.d = myAddress();
        self.e = emptyCell().asSlice();
        self.f = emptyCell();
        self.g = 5;
        self.h = null;
        self.i = null;
        self.j = null;
        self.k = null;
        self.l = null;
    }
}
