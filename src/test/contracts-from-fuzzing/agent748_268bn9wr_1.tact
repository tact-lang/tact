contract TestManyPrimitiveFields {
    a: Int;
    b: Int as uint8;
    c: Bool;
    d: Address;
    e: Cell;
    f: String;
    g: Slice;
    h: Builder;

    init() {
        self.a = 1;
        self.b = 2;
        self.c = true;
        self.d = myAddress();
        self.e = emptyCell();
        self.f = "hi";
        self.g = emptyCell().asSlice();
        self.h = beginCell();
    }
}
