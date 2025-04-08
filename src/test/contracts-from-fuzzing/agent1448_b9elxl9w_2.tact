contract ComplexContract {
    a: Int;
    b: Bool;
    c: Address;
    d: Cell;
    e: Slice;
    f: String;
    g: Bool?;
    h: Address?;
    i: Cell?;
    j: Slice?;
    k: String?;

    init() {
        self.a = 1;
        self.b = true;
        self.c = myAddress();
        self.d = emptyCell();
        self.e = emptyCell().asSlice();
        self.f = "hello";
        self.g = null;
        self.h = null;
        self.i = null;
        self.j = null;
        self.k = null;
    }
}