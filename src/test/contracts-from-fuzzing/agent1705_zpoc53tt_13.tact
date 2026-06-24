contract ChainPrimitives {
    a: Int;
    b: Bool;
    c: String;
    d: Address;
    e: Cell;
    f: Slice;
    g: String?;
    h: Int?;
    i: Bool?;

    init() {
        self.a = 1;
        self.b = true;
        self.c = "foo";
        self.d = myAddress();
        self.e = emptyCell();
        self.f = emptyCell().asSlice();
        self.g = null;
        self.h = null;
        self.i = null;
    }
}