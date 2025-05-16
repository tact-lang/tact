contract LotsOfPrimitives {
    a: Int;
    b: Bool;
    c: Int?;
    d: Bool?;
    e: String;
    f: String?;
    g: Address;
    h: Cell;
    i: Slice;

    init() {
        self.a = 1;
        self.b = false;
        self.c = null;
        self.d = null;
        self.e = "test";
        self.f = null;
        self.g = myAddress();
        self.h = emptyCell();
        self.i = emptyCell().asSlice();
    }
}
